//
// Created by os on 10/9/25.
//

#ifndef PROJECT_BASE_V1_1_SEMAPHORE_HPP
#define PROJECT_BASE_V1_1_SEMAPHORE_HPP
#include "TCB.hpp"
#include "../lib/hw.h"

//Implementation from the book OS1 (page 273) and extended for the purpose of this project

class Semaphore {
public:
    //Constructor
    Semaphore(unsigned vr):val(vr),closed(false),timeout(-1),timedOut(false){}

    //Decrement and possibly block
    int sem_wait();

    //Increment and possibly unblock
    int sem_signal();

    //Get current value of semaphore
    int getVal()const{return val;}

    //Create a semaphore
    static int createSemaphore(Semaphore** semHandle,unsigned val);

    //Close a semaphore
    static int closeSemaphore(Semaphore*id);

    //Try to wait without blocking
    int semTryToWait();

    //Wait with timeout
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
    //Current value of semaphore
    int val;

    //Is semaphore closed
    bool closed;

    //Timeout for a thread waiting on the semaphore, if thread waits longer than timeout it may be unblocked automatically
    time_t timeout;

    //Flag that indicates if the thread was unblocked due to timeout
    bool timedOut;

    //Queue of threads currently blocked, waiting on this semaphore
    List<TCB> blockedQueue;

    //Static list of all semaphores in the system
    static List<Semaphore> allSemaphoresQueue;

    //Unblock a thread from blockedQueue and put it in the Scheduler
    void unblock();

    //Block the currently running thread and add it to blockedQueue
    void block();

    //Grants acces to RISCV and TCB classes to manipulate private members
    friend class RISCV;
    friend class TCB;

    static int test;

};
#endif //PROJECT_BASE_V1_1_SEMAPHORE_HPP