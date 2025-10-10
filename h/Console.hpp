//
// Created by os on 10/10/25.
//

#ifndef PROJECT_BASE_V1_1_CONSOLE_HPP
#define PROJECT_BASE_V1_1_CONSOLE_HPP
#include "syscall_c.hpp"
#include "ConsoleBoundedBuffer.hpp"
class Console {

public:

    //Take 1 character from input Buffer
    static char consoleGetcBuff();

    //Put 1 character into output buffer
    static void consolePutcBuff(char character);

    //Make new input buffer
    static void setInputBuff();

    //Make new output buffer and special thread for consumer(blocked while buff empty)
    static int startPutcThread(thread_t *threadHandle);

    //Append (put) a character into input buffer
    static void inputBuffAppend(char character);

    //I/O routine for sending a single character to console
    static void putc_S(char character);

    //Get output buffer
    static  ConsoleBoundedBuffer* getOutputBuff();

    //Get input buffer
    static  ConsoleBoundedBuffer* getInputBuff();


private:

    //Take a char from output buffer and send to console register when ready (console output worker thread)
    static void putThr(void*);

    //Output buffer
    static ConsoleBoundedBuffer* outputBuff;

    //Input buffer
    static ConsoleBoundedBuffer* inputBuff;

};
#endif //PROJECT_BASE_V1_1_CONSOLE_HPP