//
// Created by os on 10/1/25.
//

#ifndef PROJECT_BASE_V1_1_CCB_HPP
#define PROJECT_BASE_V1_1_CCB_HPP

#include "Scheduler.hpp"
#include "../lib/hw.h"
#include  "RISCV.hpp"
#include  "MemoryAllocator.hpp"
//Thread control block implementation from 7th video of exercises and extended for the purpose of this project
//Encapsulates single threads context, stack and state
class TCB {
public:
    //~TCB(){delete[] stack;}
    //Destructor
    ~TCB();

    //Function pointer type for thread body
    using Body=void(*)(void*);

    //Exit the currently running thread (system call)
    static int exitTCB();

    //Create a new thread, optionally specifying its stack and function
    static int createThread(TCB** thrHandle, Body body = nullptr, void* arg = nullptr, char* stackSpace = nullptr);

    //Check if thread is finished
    bool isFinished() const {return finished;}

    //Mark thread as finished
    void setFinished(bool finished) {this->finished = finished;}


    /*uint64 time_slice() const {
        return timeSlice;
    }*/

    //Dispatch the next thread from the sceduler
    static void dispatch();

/*
    void set_time_slice(uint64 time_slice) {
        timeSlice = time_slice;
    }*/

    //Check if scheduler is empty
    static bool schedulerIsEmpty();

    //Currently running thread
    static TCB *running;

    void* operator new(size_t size) {return MemoryAllocator::mem_alloc(size);}
    void* operator new[](size_t size) {return MemoryAllocator::mem_alloc(size);}
    void operator delete(void *ptr) {MemoryAllocator::mem_free(ptr);}
    void operator delete[](void *ptr) {MemoryAllocator::mem_free(ptr);}

private:

    //Constructor that initializes thread context and optionally adds it to the scheduler
    TCB(Body body, void* arg, char* stack_space, bool system_mode);

    //CPU context saved for context switching
    struct Context {
        uint64 ra;  //Address
        uint64 sp;  //Stack pointer
    };

    //Threads function to execute
    Body body;

    //Thread stack memory
    char *stack;

    //Saved CPU context
    Context context;

    //uint64 timeSlice;

    //Whether thread has finished execution or not
    bool finished;

    //Argument passed to the thread function
    void *arg;

    //Remain sleep time for sleeping threads
    time_t timeSleeping;

    //List of currently sleeping threads
    static List<TCB>sleepingThreads;

    //Put the current thread to sleep for a given time
    static void timeSleep(time_t t);

    //Yield cpu voluntarily (trigger context switch)
    static void yield();


    //Allow certain classes to access private members
    friend class RISCV;
    friend class Semaphore;
    friend class Console;

    //Wrapper functions to execute thread body in proper CPU mode
    static void threadWrapper();
    static void systemThreadWrapper();

    //Counter to track time slice usage
    static uint64 timeSliceCounter;

    //Perform context switch between threads (implementation in assembly)
    static void contextSwitch(Context *oldC, Context *newC);

    //Stack size constant
    static uint64 constexpr  STACK_SIZE=1024;

    //Default time slice for threads
    static uint64 constexpr TIME_SLICE=2;
};



#endif //PROJECT_BASE_V1_1_TCB_HPP