//
// Created by os on 10/10/25.
//

#ifndef PROJECT_BASE_V1_1_CONSOLEBUFFER_HPP
#define PROJECT_BASE_V1_1_CONSOLEBUFFER_HPP
#include "Semaphore.hpp"

// Thread-safe circular character buffer for console I/O.
// Implementation based on the bounded buffer algorithm from OS1 textbook (p. 278),
// adapted with separate head/tail mutexes and semaphores for input/output slots.

class ConsoleBoundedBuffer {

public:
    //Constructor
    ConsoleBoundedBuffer(int len);

    //Destructor
    ~ConsoleBoundedBuffer();

    // Removes and returns a character from the buffer (blocks if empty)
    char take();

    // Adds a character to the buffer (blocks if full)
    void append(char character);

private:
    int len;
    char *buff;
    int head,tail;

    Semaphore *mutexHead;   //Protects head
    Semaphore *mutexTail;   //Protects tail
    Semaphore *availableItems;  //"Counts" filled slots
    Semaphore *availableSpaces; //"Counts" empty slots

};
#endif //PROJECT_BASE_V1_1_CONSOLEBUFFER_HPP