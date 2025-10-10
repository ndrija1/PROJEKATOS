#include "../h/MemoryAllocator.hpp"
#include "../h/RISCV.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../h/Console.hpp"

void userMain();

void userMainTests();

void userMainWrapper(void* arg) {
    //    userMain();
    userMainTests();
}

void main() {
    // initialize the kernel
    MemoryAllocator::Initialize();
    RISCV::w_stvec((size_t)(&RISCV::supervisorTrap));

    thread_t threads[4];
    thread_create(&threads[0], nullptr, nullptr);
    TCB::running = threads[0]; // must be init. imm. after we create a thread for main

    // terminal thread for putc and initialize buffer for getc
    Console::setInputBuff();
    Console::startPutcThread(&threads[2]);

    thread_create(&threads[1], &userMainWrapper, nullptr);

    RISCV::ms_sstatus(RISCV::SSTATUS_SIE);

    while (!threads[1]->isFinished() || !TCB::schedulerIsEmpty()) {
        thread_dispatch();
    }

    for (auto &thread : threads) {
        delete thread;
    }

    RISCV::halt();
}