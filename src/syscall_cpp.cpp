//
// Created by os on 10/9/25.
//

#include "../h/syscall_cpp.hpp"
#include  "../h/TCB.hpp"
void *operator new(size_t size) {
    return mem_alloc(size);
}

void *operator new[](size_t size) {
    return mem_alloc(size);
}

void operator delete(void *mem) noexcept {
    mem_free(mem);
}

void operator delete[](void *mem) noexcept {
    mem_free(mem);
}
Thread::Thread(void (*body)(void *), void *arg) {
    this->body = body;
    this->arg = arg;
    this->myHandle = nullptr;
}

Thread::Thread() {
    this->body = runWrapper;
    this->arg = this;
    this->myHandle = nullptr;
}

Thread::~Thread() {
    if (myHandle->isFinished()) delete myHandle;
}

int Thread::start() {
    thread_create(&this->myHandle, this->body, this->arg);
    if (this->myHandle) return 0;
    else return -1;
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

void Thread::runWrapper(void* thisObj) {
    ((Thread*)thisObj)->run();
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&this->myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(this->myHandle);
}

int Semaphore::wait() {
    return sem_wait(this->myHandle);
}

int Semaphore::signal() {
    return sem_signal(this->myHandle);
}

PeriodicThread::PeriodicThread(time_t period): Thread() {
    this->period = period;
}

void PeriodicThread::terminate() {
    period = 0;
}

void PeriodicThread::run() {
    while (period != 0) {
        periodicActivation();
        if (Thread::sleep(period) < 0) break;
    }
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
