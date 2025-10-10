//
// Created by os on 10/1/25.
//

#include "../h/TCB.hpp"
#include "../h/RISCV.hpp"
#include  "../h/Scheduler.hpp"
List<TCB>TCB::sleepingThreads;
TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter=0;
TCB::TCB(Body b, void *arg, char *stack_space, bool system_mode) {
    this->body = b;
    this->stack = stack_space;
    this->arg = arg;
    this->finished = false;
    this->context = {
        !system_mode ? (size_t)threadWrapper : (size_t)systemThreadWrapper,
        stack ? (size_t)&stack[DEFAULT_STACK_SIZE] : 0
};
    if (body!=nullptr) Scheduler::put(this);
}
TCB::~TCB() {
    MemoryAllocator::mem_free(stack);
}
// For original signature
int TCB::createThread(TCB** thrHandle,Body b,void*arg,char *stack_space) {
    TCB *newT=new TCB(b,arg,stack_space,true);
    if (newT==nullptr){thrHandle=nullptr;return -1;}
    *thrHandle=newT;
    return 0;
}

bool TCB::schedulerIsEmpty() {
    return Scheduler::peekFirst() == nullptr;
}

void TCB::yield(){

    __asm__ volatile("ecall");

}

void TCB::dispatch() {
    TCB *old=running;
    if (!old->isFinished() ) {
        Scheduler::put(old);
    }
    running=Scheduler::get();
    contextSwitch(&old->context,&running->context);
}
void TCB::threadWrapper() {
    RISCV::popSppSpie();
    running->body(running->arg);
    running->setFinished(true);
    RISCV::w_a0(0x13);
    TCB::yield();
}

void TCB::systemThreadWrapper() {
    RISCV::systemPopSppSpie();
    running->body(running->arg);
    running->setFinished(true);
    RISCV::w_a0(0x13);
    TCB::yield();
}

void TCB::timeSleep(time_t time) {
    running->timeSleeping=time;
    sleepingThreads.addFirst(running);

    TCB* oldThr=running;
    running=Scheduler::get();
    contextSwitch(&oldThr->context,&running->context);
}