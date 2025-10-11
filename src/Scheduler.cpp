//
// Created by os on 9/30/25.
//

#include "../h/Scheduler.hpp"

List<TCB>Scheduler::readyThreadsQueue;

TCB *Scheduler::get() {
    return readyThreadsQueue.removeFIrst();
}

void Scheduler::put(TCB *ccb) {
    readyThreadsQueue.addLast(ccb);
}

TCB* Scheduler::peekFirst() {
    return readyThreadsQueue.peekFirst();
}
