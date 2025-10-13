#include "../h/MemoryAllocator.hpp"
#include "../h/RISCV.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../h/Console.hpp"

void userMain();

void userMainTests();

void userMainWrapper(void* arg) {
    //    userMain();
    userMainTests();
}

void main() {
    // initialize the kernel
    MemoryAllocator::initialize();
    RISCV::w_stvec((size_t)(&RISCV::supervisorTrap));

    thread_t threads[4];
    thread_create(&threads[0], nullptr, nullptr);//Idle/main kernel thread
    TCB::running = threads[0]; // must be init. imm. after we create a thread for main, without this scheduler and context switch have no reference to curr head

    //Terminal thread for putc and initialize buffer for getc
    Console::initInputBuffer();
    Console::startOutputService(&threads[2]);

    //Start user thread (first level user thread)
    thread_create(&threads[1], &userMainWrapper, nullptr);

    //Enable interrupts and run scheduler (Enables supervisor Interrupt Enable bit)
    RISCV::ms_sstatus(RISCV::SSTATUS_SIE);

    //Wait for all threads to finish
    while (!threads[1]->isFinished() || !TCB::schedulerIsEmpty()) {
        thread_dispatch();
    }

    //Cleanup and halt
    for (auto &thread : threads) {
        delete thread;
    }

    RISCV::halt();
}