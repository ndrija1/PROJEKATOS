//
// Created by os on 10/10/25.
//

#include "../h/ConsoleBoundedBuffer.hpp"


ConsoleBoundedBuffer::ConsoleBoundedBuffer(int len)
    :len(len),head(0),tail(0) {

    buff=new char[len];

    Semaphore::createSemaphore(&mutexTail,1);
    Semaphore::createSemaphore(&mutexHead,1);
    Semaphore::createSemaphore(&availableItems,0);
    Semaphore::createSemaphore(&availableSpaces,len);
}

ConsoleBoundedBuffer::~ConsoleBoundedBuffer() {
    //delete[] buff;
    delete buff;

    Semaphore::closeSemaphore(availableSpaces);
    Semaphore::closeSemaphore(availableItems);
    Semaphore::closeSemaphore(mutexTail);
    Semaphore::closeSemaphore(mutexHead);

    delete availableItems;
    delete availableSpaces;
    delete mutexTail;
    delete mutexHead;
}

void ConsoleBoundedBuffer::append(char character) {
    availableSpaces->sem_wait();
    mutexTail->sem_wait();

    buff[tail]=character;
    tail=(tail+1)% len;

    mutexTail->sem_signal();
    availableItems->sem_signal();
}

char ConsoleBoundedBuffer::take() {
    availableItems->sem_wait();
    mutexHead->sem_wait();

    char temp=buff[head];
    head=(head+1)% len;

    mutexHead->sem_signal();
    availableSpaces->sem_signal();

    return temp;
}




