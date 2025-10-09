//
// Created by os on 10/9/25.
//
#include "../h/Scheduler.hpp"
#include "../h/Semaphore.hpp"

List<Semaphore> Semaphore::allSemaphoresQueue;

int Semaphore::createSemaphore(Semaphore **semHandle, unsigned val) {
    Semaphore *semaphore=new Semaphore(val);
    if (semaphore==nullptr){return -1;}
    *semHandle=semaphore;
    allSemaphoresQueue.addFirst(semaphore);
    return 0;
}

int Semaphore::closeSemaphore(Semaphore *id) {
    if (id->closed){return -1;}
    id->closed=true;
    while (id->blockedQueue.peekFirst()) {
        Scheduler::put(id->blockedQueue.removeFIrst());
    }
    return 0;
}
int Semaphore::sem_wait() {
    if (--val<0) {
        block();
    }
    if (this->closed) {
        return -1;
    }
    return 0;
}
int Semaphore::sem_signal() {
    if (++val<=0) {
        unblock();
    }
    return 0;
}

void Semaphore::block() {
    TCB*oldT=TCB::running;
    blockedQueue.addLast(oldT);
    TCB::running=Scheduler::get();
    TCB::contextSwitch(&oldT->context,&TCB::running->context);
}

void Semaphore::unblock() {
    TCB *thread=blockedQueue.removeFIrst();
    if (thread) {
        Scheduler::put(thread);
    }
}


int Semaphore::semTryToWait() {
    if (this->getVal()-1>=0) {
        this->val--;
        return 0;
    }
    return 1;
}

int Semaphore::semTimeWait(time_t t) {
    val--;
    if (val<0) {
        this->timeout=t;
        block();
    }
    if (this->closed)return -1;
    if (this->timedOut)return -2;
    return 0;
}



