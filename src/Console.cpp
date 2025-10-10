//
// Created by os on 10/10/25.
//

#include "../h/Console.hpp"

ConsoleBoundedBuffer* Console::inputBuff;
ConsoleBoundedBuffer* Console::outputBuff;

char Console::consoleGetcBuff() {
    return inputBuff->take();
}

void Console::consolePutcBuff(char character) {
    outputBuff->append(character);
}

void Console::setInputBuff() {
    inputBuff=new ConsoleBoundedBuffer(256);
}

int Console::startPutcThread(thread_t *threadHandle) {
    outputBuff=new ConsoleBoundedBuffer(256);

    char *stack=(char*)MemoryAllocator::mem_alloc(DEFAULT_STACK_SIZE);
    if (stack==nullptr) {
        return -1;
    }
    TCB *thread=new TCB(putThr,nullptr,stack,true);
    if (thread==nullptr) {
        *threadHandle=nullptr;
        return -1;
    }
    *threadHandle=thread;
    return 0;
}

void Console::inputBuffAppend(char character) {
    inputBuff->append(character);
}

void Console::putc_S(char character) {
    while (!(*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {
        //Wait for console to be ready to send next character
    }
    *((char*)CONSOLE_TX_DATA) = character;//Write character to the console data register
}

ConsoleBoundedBuffer* Console::getOutputBuff() {
    return  outputBuff;
}

ConsoleBoundedBuffer* Console::getInputBuff() {
    return  inputBuff;
}

void Console::putThr(void * arg) {
    while (true) {  //system background thread dedicated to outputting data
        while (!(*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {}//Poll the console status reg until transmit buffer is ready (busy-wait)
        *((char*)CONSOLE_TX_DATA) = outputBuff->take(); //Take the next character from output buffer and writes to reg
    }
}
