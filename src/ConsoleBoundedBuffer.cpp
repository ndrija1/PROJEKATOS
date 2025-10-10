//
// Created by os on 10/10/25.
//

#include "../h/ConsoleBoundedBuffer.hpp"

//Implementacija uzeta iz 278 strane knjige OS1, BoundedBuffer

ConsoleBoundedBuffer::ConsoleBoundedBuffer(int len):len(len),head(0),tail(0) {
    buff=new char[len];
    Semaphore::createSemaphore(&mutexT,1);
    Semaphore::createSemaphore(&mutexH,1);
    Semaphore::createSemaphore(&input,0);
    Semaphore::createSemaphore(&output,len);
}

ConsoleBoundedBuffer::~ConsoleBoundedBuffer() {
    delete buff;
    Semaphore::closeSemaphore(output);
    Semaphore::closeSemaphore(input);
    Semaphore::closeSemaphore(mutexT);
    Semaphore::closeSemaphore(mutexH);

    delete input;
    delete output;
    delete mutexT;
    delete mutexH;
}

void ConsoleBoundedBuffer::append(char character) {
    output->sem_wait();
    mutexT->sem_wait();
    buff[tail]=character;
    tail=(tail+1)% len;
    mutexT->sem_signal();
    input->sem_signal();
}

char ConsoleBoundedBuffer::take() {
    input->sem_wait();
    mutexH->sem_wait();
    char temp=buff[head];
    head=(head+1)% len;
    mutexH->sem_signal();
    output->sem_signal();
    return temp;
}




