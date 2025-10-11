//
// Created by os on 9/30/25.
//

#ifndef PROJECT_BASE_V1_1_SCHEDULER_HPP
#define PROJECT_BASE_V1_1_SCHEDULER_HPP
#include "list.hpp"
class TCB;
class Scheduler {
private:
    static List<TCB> readyThreadsQueue;//queue of ready coroutines (Coroutine control block)
public:
    //Get a thread from scheduler
    static TCB *get();

    //Put a thread into scheduler
    static void put(TCB *ccb);

    //See which thread is next
    static TCB* peekFirst();
};
#endif //PROJECT_BASE_V1_1_SCHEDULER_HPP