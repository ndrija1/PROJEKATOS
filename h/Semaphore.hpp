//
// Created by os on 10/9/25.
//

#ifndef PROJECT_BASE_V1_1_SEMAPHORE_HPP
#define PROJECT_BASE_V1_1_SEMAPHORE_HPP
#include "TCB.hpp"
#include "../lib/hw.h"

class Semaphore {
    public:
    Semaphore(unsigned vr):val(vr),closed(false),timeout(-1),timedOut(false){}

    int sem_wait();
    int sem_signal();

    int getVal()const{return val;}

    static int createSemaphore(Semaphore** semHandle,unsigned val);
    static int closeSemaphore(Semaphore*id);

    int semTryToWait();
    int semTimeWait(time_t t);

    void* operator new(size_t size) {
        return MemoryAllocator::mem_alloc(size);
    }

    void* operator new[](size_t size) {
        return MemoryAllocator::mem_alloc(size);
    }

    void operator delete(void *ptr) {
        MemoryAllocator::mem_free(ptr);
    }

    void operator delete[](void *ptr) {
        MemoryAllocator::mem_free(ptr);
    }

private:
    int val;
    bool closed;
    time_t timeout;
    bool timedOut;

    List<TCB> blockedQueue;
    static List<Semaphore> allSemaphoresQueue;

    void unblock();
    void block();

    friend class RISCV;
    friend class TCB;

    static int test;

};
#endif //PROJECT_BASE_V1_1_SEMAPHORE_HPP