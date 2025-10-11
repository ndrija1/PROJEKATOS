//
// Created by os on 10/10/25.
//

#ifndef PROJECT_BASE_V1_1_CONSOLE_HPP
#define PROJECT_BASE_V1_1_CONSOLE_HPP
#include "syscall_c.hpp"
#include "ConsoleBoundedBuffer.hpp"

//Input: "hardware ->buffer -> user
//Output: "user ->buffer -> hardware

class Console {
public:
    // Initialize input/output buffers and start output worker thread
    static int initialize(thread_t* threadHandle);

    //Take(remove) 1 character from input Buffer
    static char readChar();

    //Put 1 character into output buffer
    static void writeChar(char character);

    //Initialize new input buffer
    static void initInputBuffer();

    //Make new output buffer and special thread for consumer(blocked while buff empty)
    static int startOutputService(thread_t *threadHandle);

    //Append (put) a character into input buffer
    static void onCharRecieved(char character);

    //I/O routine for sending a single character to console
    static void writeCharSync(char character);

    //Get output buffer
    static  ConsoleBoundedBuffer* getOutputBuff();
    //Get input buffer
    static  ConsoleBoundedBuffer* getInputBuff();

    // Check if Console is initialized
   // static bool isInitialized();

    Console(const Console&) = delete;
    Console& operator=(const Console&) = delete;

private:

    //Take a char from output buffer and send to console register when ready (console output worker thread)
    static void outputWorker(void*);

    //Output buffer
    static ConsoleBoundedBuffer* outputBuff;
    //Input buffer
    static ConsoleBoundedBuffer* inputBuff;


};
#endif //PROJECT_BASE_V1_1_CONSOLE_HPP