//
// Created by os on 10/10/25.
//

#ifndef PROJECT_BASE_V1_1_CONSOLEBUFFER_HPP
#define PROJECT_BASE_V1_1_CONSOLEBUFFER_HPP
#include "Semaphore.hpp"

//implementacija uzeta iz knjige 278 strana, prosirena verzija BoundedBuffer-a

class ConsoleBoundedBuffer {

public:
    ConsoleBoundedBuffer(int len);
    ~ConsoleBoundedBuffer();

    char take();
    void append(char character);

private:
    int len;
    char *buff;
    int head,tail;

    Semaphore *mutexH;
    Semaphore *mutexT;
    Semaphore *input;
    Semaphore *output;

};
#endif //PROJECT_BASE_V1_1_CONSOLEBUFFER_HPP