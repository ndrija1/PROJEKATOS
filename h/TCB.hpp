//
// Created by os on 10/1/25.
//

#ifndef PROJECT_BASE_V1_1_CCB_HPP
#define PROJECT_BASE_V1_1_CCB_HPP

#include "Scheduler.hpp"
#include "../lib/hw.h"
#include  "RISCV.hpp"
#include  "memoryAllocator.hpp"
//Thread C b
class TCB {
public:
    //~TCB(){delete[] stack;}

    using Body=void(*)(void*);

    static int exitTCB();

    static int createThread(TCB** thrHandle, Body body = nullptr, void* arg = nullptr, char* stackSpace = nullptr);

    bool isFinished() const {return finished;}

    void setFinished(bool finished) {this->finished = finished;}


    /*uint64 time_slice() const {
        return timeSlice;
    }*/
    static void dispatch();

/*
    void set_time_slice(uint64 time_slice) {
        timeSlice = time_slice;
    }*/

    static bool schedulerIsEmpty();

    static TCB *running;

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

    ~TCB();


private:
    TCB(Body body, void* arg, char* stack_space, bool system_mode);


    struct Context {
        uint64 ra;
        uint64 sp;
    };
    Body body;
    char *stack;
    Context context;
    //uint64 timeSlice;
    bool finished;
    void *arg;
    time_t timeSleeping;

    static List<TCB>sleepingThreads;

    static void timeSleep(time_t t);

    static void yield();


    friend class RISCV;
    friend class Semaphore;


    static void threadWrapper();
    static void systemThreadWrapper();

    static uint64 timeSliceCounter;

    static void contextSwitch(Context *oldC, Context *newC);


    static uint64 constexpr  STACK_SIZE=1024;

    static uint64 constexpr TIME_SLICE=2;
};



#endif //PROJECT_BASE_V1_1_TCB_HPP