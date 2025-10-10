#include "../h/RISCV.hpp"
#include "../h/Console.hpp"
#include "../h/TCB.hpp"
#include "../h/printing.hpp"
#include "../h/Scheduler.hpp"
#include "../h/Semaphore.hpp"
#include "../h/MemoryAllocator.hpp"

void RISCV::popSppSpie() {
     mc_sstatus(SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}

void RISCV::systemPopSppSpie() {
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}
void RISCV::handleSupervisorTrap() {
    uint64  volatile scause = r_scause();
    uint64 volatile code=r_a0();
    uint64 volatile arg1=r_a1();
    uint64 volatile arg2=r_a2();
    uint64 volatile arg3=r_a3();
    uint64 volatile arg4=r_a4();

    if (scause == 0x0000000000000009UL || scause == 0x0000000000000008UL ) {
        //interrupt: no cause:call from S-mode
        //Ecall from sys/usr mode
        uint64 volatile sepc = r_sepc()+4;
        uint64 volatile sstatus = r_sstatus();
        switch (code) {
                //mem_alloc
            case 0x01: {
                size_t volatile size_in_bytes=r_a1()*MEM_BLOCK_SIZE;
                void *ret=MemoryAllocator::mem_alloc(size_in_bytes);
                returnSysCall((size_t)ret);
                break;
            }
                //mem_free
            case 0x02: {
                void* volatile start=(void*)r_a1();
                int ret=MemoryAllocator::mem_free(start);
                returnSysCall((size_t)ret);
                break;
            }
                //mem_get_free_space
            case 0x03: {
                size_t ret=MemoryAllocator::mem_get_free_space();
                returnSysCall(ret);
                break;
            }
                //mem_get_largest_free_block
            case 0x04: {
                size_t ret=MemoryAllocator::mem_get_largest_free_block();
                returnSysCall(ret);
                break;
            }
                //thread_create
            case 0x11:{
                TCB **threadcreatHandle=(TCB**)arg1;
                TCB::Body routine=(TCB::Body)arg2;
                void *arg=(void*)arg3;
                char *stack=(char*)arg4;
                int ret = TCB::createThread(threadcreatHandle,routine,arg,stack);

                returnSysCall((size_t)ret);
                break;
            }
                //thread_exit
            case 0x12:{
                TCB::running->setFinished(true);
                TCB::dispatch();
                break;
            }
                //dispatch
            case 0x13: {
                TCB::dispatch();
                break;
            }
                //sem_open()
            case 0x21: {
                Semaphore **semHandle=(Semaphore**)arg1;
                unsigned initialize=(unsigned)arg2;
                int ret=Semaphore::createSemaphore(semHandle,initialize);
                returnSysCall((size_t)ret);
                break;
            }
                //sem_close()
            case 0x22: {
                Semaphore *semId=(Semaphore*)arg1;
                int ret=Semaphore::closeSemaphore(semId);
                delete semId;

                returnSysCall((size_t)ret);
                break;

            }
                //sem_wait()
            case 0x23: {
                Semaphore *semId=(Semaphore*)arg1;
                int ret=semId->sem_wait();

                returnSysCall((size_t)ret);
                break;
            }
                //sem_signa;()
            case 0x24: {
                Semaphore *semId=(Semaphore*)arg1;
                int ret=semId->sem_signal();

                returnSysCall((size_t)ret);
                break;
            }
                //time_sleep()
            case 0x31: {
                time_t time=(time_t)arg1;
                TCB::timeSleep(time);

                break;
            }
                //getc()
            case 0x41: {
                char ret=Console::consoleGetcBuff();
                returnSysCall((size_t)ret);
                break;
            }
                //putc()
            case 0x42: {
                char character=(char)arg1;
                Console::consolePutcBuff(character);
                break;
            }
                //Unsupported system-call code
            default: {
                printStringS("Unsupported system-call code.");
                break;
            }
        }
        //TCB::timeSliceCounter = 0;
        //TCB::dispatch();
        w_sstatus(sstatus);
        w_sepc(sepc);
        w_scause(scause);
    }

    else if (scause == 0x8000000000000001UL) {
    //interrupt: yes, cause code: supervisor software interrupt
        //Timer interrupt
        mc_sip(SIP_SSIP);

        Semaphore::allSemaphoresQueue.setFirst();
        while (Semaphore::allSemaphoresQueue.getCurrent()!=nullptr) {
            if (Semaphore::allSemaphoresQueue.getCurrent()->timeout<0) {
                continue;
            }
            Semaphore::allSemaphoresQueue.getCurrent()->timeout-=1;
            if (Semaphore::allSemaphoresQueue.getCurrent()->timeout==0) {
                while (Semaphore::allSemaphoresQueue.getCurrent()->blockedQueue.peekFirst()) {
                    Scheduler::put(Semaphore::allSemaphoresQueue.getCurrent()->blockedQueue.removeFIrst());
                }
                Semaphore::allSemaphoresQueue.getCurrent()->timedOut=true;
            }
            Semaphore::allSemaphoresQueue.next();
        }

        TCB::sleepingThreads.setFirst();
        while (TCB::sleepingThreads.getCurrent()!=nullptr) {
            TCB::sleepingThreads.getCurrent()->timeSleeping-=1;
            if (TCB::sleepingThreads.getCurrent()->timeSleeping==0) {
                Scheduler::put(TCB::sleepingThreads.removeCurrent());
            }
            TCB::sleepingThreads.next();
        }


        TCB::timeSliceCounter++;
        if (TCB::timeSliceCounter>=DEFAULT_TIME_SLICE) {

            uint64 volatile sepc = r_sepc();
            uint64 volatile sstatus = r_sstatus();
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
            w_scause(scause);
        }
       // mc_sip(SIP_SSIP);


    }
    else if (scause == 0x8000000000000009UL) {
        uint64 volatile sepc=r_sepc();
        uint64 volatile sstatus=r_sstatus();
        int interrupt=plic_claim();
        mc_sip(SIP_SEIP);

        //Console interrupt
        if (interrupt==CONSOLE_IRQ) {
            // polling
            while ((*((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
                char character = (char)(*((char*)CONSOLE_RX_DATA));
                if ((int)character == 13) character = '\n';
                Console::inputBuffAppend(character);
            }
        }
        plic_complete(interrupt);

        w_sepc(sepc);
        w_sstatus(sstatus);
        w_scause(scause);
    }
    else {
        //Unexpected trap cause
        size_t volatile sepc = r_sepc();
        printStringS("Exception!!! scause: ");
        printIntS(scause);
        printStringS("\n sepc: ");
        printIntS(sepc);
        while (true) {}
    }
}
