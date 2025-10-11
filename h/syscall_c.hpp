//
// Created by os on 10/9/25.
//

#ifndef PROJECT_BASE_V1_1_SYSCALL_C_H
#define PROJECT_BASE_V1_1_SYSCALL_C_H
#include "../lib/hw.h"

//Memory allocator
void* mem_alloc(size_t size);
int mem_free(void* startAddr);
size_t mem_get_free_space();//returns in bytes
size_t mem_get_largest_free_block();//returns in bytes

//Thread
class TCB;
typedef TCB* thread_t;
int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);
int thread_exit();
void thread_dispatch();

//Semaphore
class Sem;
typedef Sem* sem_t;
int sem_open(sem_t* handle, unsigned init);
int sem_close(sem_t handle);
int sem_wait(sem_t id);
int sem_signal (sem_t id);

//Sleep function
typedef unsigned long time_t;
int time_sleep (time_t);

//Console
const int EOF = -1;
char getc ();
void putc (char);
#endif //PROJECT_BASE_V1_1_SYSCALL_C_H