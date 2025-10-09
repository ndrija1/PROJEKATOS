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
    static TCB *get();
    static void put(TCB *ccb);
    static TCB* peekFirst();
};
#endif //PROJECT_BASE_V1_1_SCHEDULER_HPP