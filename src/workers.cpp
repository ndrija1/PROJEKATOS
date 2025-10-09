#include "../lib/hw.h"
#include "../h/TCB.hpp"
//#include "../h/syscall_c.h"
#include  "../lib/console.h"
#include "../h/print.hpp"

static uint64 fibonacci(uint64 n)
{
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) {
        TCB::yield();
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}
void workerBodyA() {
    for (uint64 i=0;i<10;i++) {
        printStringS("A=");
        printIntS(i);
        printStringS("\n");
        for (uint64 j=10;j<10000;j++) {
            for (uint64 k=0;k<30000;k++) {
                //busy wait
            }
            //TCB:yield();
        }
    }
}
void workerBodyB() {
    for (uint64 i=0;i<16;i++) {
        printStringS("B=");
        printIntS(i);
        printStringS("\n");
        for (uint64 j=0;j<10000;j++) {
            for (uint64 k=0;k<30000;k++) {
                //busy wait
            }
            //TCB:yield();
        }
    }
}
void workerBodyC()
{
    uint8 i = 0;
    for (; i < 3; i++)
    {

        printStringS("C: i=");
        printIntS(i);
        printStringS("\n");

    }
    printStringS("c: yield\n");

    __asm__ ("li t1, 7");
  //  TCB::yield();

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));

    printStringS("c: t1=");
    printIntS(t1);
    printStringS("\n");




    uint64 result = fibonacci(20);
    printStringS("c: fibonaci=");
    printIntS(result);
    printStringS("\n");

    for (; i < 6; i++)
    {
        printStringS("C: i=");
        printIntS(i);
       printStringS("\n");
    }

  //  TCB::running->setFinished(true);
  //  TCB::yield();
}

void workerBodyD()
{
    uint8 i = 10;
    //thread_join((thread_t) arg);
    for (; i < 13; i++)
    {

        printStringS("d: i=");
        printIntS(i);
        printStringS("\n");
    }

    printStringS("d: yield\n");

    __asm__ ("li t1, 5");
   // TCB::yield();

    uint64 result = fibonacci(23);printStringS("D: fibonaci=");
  printIntS(result);
  printStringS("\n");

    for (; i < 16; i++)
    {
        printStringS("d: i=");
        printIntS(i);
        printStringS("\n");
    }

  //  TCB::running->setFinished(true);
    //TCB::yield();
}
/*
//test semafora
void workerBodyC(void* arg) {
    printStringS("C: poziva se dispatch1.\n");
    thread_dispatch();
    printStringS("C: poziva se dispatch2..\n");
    thread_dispatch();
    printStringS("C: poziva se dispatch3...\n");
    thread_dispatch();
    printStringS("C: poziva se dispatch4....\n");
    printStringS("C: Signal semafora!\n");
    sem_close((sem_t) arg);
    thread_dispatch();
    printStringS("C: posle signala..\n");
    printStringS("C: posle signala.2.\n");
}


void workerBodyD(void *arg) {
    printStringS("D: Usli smo u D 1. put\n");
    printStringS("D: Cekamo na semaforu..\n");

    int returnValue = sem_wait((sem_t) arg);

    printStringS("D: rezultat: ");
    printIntS(returnValue);
    printStringS("\nD: izlazim automatski, pozdrav!\n");
}*/