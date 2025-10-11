//
// Created by os on 10/10/25.
//

#include "../h/Console.hpp"

ConsoleBoundedBuffer* Console::inputBuff;
ConsoleBoundedBuffer* Console::outputBuff;
/*int Console::initialize(thread_t* threadHandle) {
    if (initialized) return 0; // already initialized

    initInputBuffer();
    //initOutputBuffer();

    char* stack = (char*)MemoryAllocator::mem_alloc(DEFAULT_STACK_SIZE);
    if (!stack) return -1;

    TCB* thread = new TCB(outputWorker, nullptr, stack, true);
    if (!thread) {
        *threadHandle = nullptr;
        return -1;
    }

    *threadHandle = thread;
    initialized = true;
    return 0;
}*/

char Console::readChar() {
    if (!inputBuff) return '\0';
    return inputBuff->take();
}

void Console::writeChar(char character) {
    if (outputBuff!=nullptr) {
        outputBuff->append(character);
    }
}

void Console::initInputBuffer() {
    inputBuff=new ConsoleBoundedBuffer(256);
}

int Console::startOutputService(thread_t *threadHandle) {
    outputBuff=new ConsoleBoundedBuffer(256);

    char *stack=(char*)MemoryAllocator::mem_alloc(DEFAULT_STACK_SIZE);
    if (stack==nullptr) {
        return -1;
    }
    TCB *thread=new TCB(outputWorker,nullptr,stack,true);
    if (thread==nullptr) {
        *threadHandle=nullptr;
        return -1;
    }
    *threadHandle=thread;
    return 0;
}

void Console::onCharRecieved(char character) {
    if (!inputBuff) return;
    inputBuff->append(character);
}

void Console::writeCharSync(char character) {
    while (!(*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {
        //Wait for console to be ready to send next character (Busy-wait)
    }
    *((char*)CONSOLE_TX_DATA) = character;//Write character to the console data register
}

ConsoleBoundedBuffer* Console::getOutputBuff() {
    return  outputBuff;
}

ConsoleBoundedBuffer* Console::getInputBuff() {
    return  inputBuff;
}

void Console::outputWorker(void * arg) {
    while (true) {  //system background thread dedicated to outputting data (wait until hardware ready)
        while (!(*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {}//Poll the console status reg until transmit buffer is ready (busy-wait)
        *((char*)CONSOLE_TX_DATA) = outputBuff->take(); //Take the next character from output buffer and writes to reg
    }
}

