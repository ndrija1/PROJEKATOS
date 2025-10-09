//
// Created by os on 10/9/25.
//
#include "../h/syscall_c.hpp"
#include "../h/RISCV.hpp"
#include "../lib/hw.h"

void do_syscall(size_t arg0, size_t arg1 = 0, size_t arg2 = 0, size_t arg3 = 0, size_t arg4 = 0, size_t arg5 = 0) {
    __asm__ volatile ("ecall");//NAUCITI STA JE OVO
}

void *mem_alloc(size_t sz) {
    if (sz<=0)return nullptr;
    size_t blcks=(sz/MEM_BLOCK_SIZE)+(sz%MEM_BLOCK_SIZE==0?0:1);
    do_syscall(0x01,blcks);
    void *volatile ret=(void*)RISCV::r_a0();
    return ret;
}

int mem_free(void *addr) {
    if (addr==nullptr)return -1;
    do_syscall(0x02,(uint64)addr);
    int volatile ret=(int)RISCV::r_a0();
    return ret;
}
size_t mem_get_free_space() {
    do_syscall(0x03);
    size_t volatile ret = (size_t)RISCV::r_a0();
    return ret;
}

size_t mem_get_largest_free_block() {
    do_syscall(0x04);
    size_t volatile ret = (size_t)RISCV::r_a0();
    return ret;
}

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg) {
    if(handle==nullptr)return -1;
    void *stack=nullptr;
    if(start_routine){
    stack=mem_alloc(DEFAULT_STACK_SIZE);
    if(stack==nullptr)return -1;
    }
    do_syscall(0x11, (size_t)handle, (size_t)start_routine, (size_t)arg, (size_t)stack);
    int volatile ret=(int)RISCV::r_a0();
    return ret;
}

int thread_exit(){
    do_syscall(0x12);
    int volatile ret=(int)RISCV::r_a0();
    return ret;
}

void thread_dispatch(){
    do_syscall(0x13);
}

int sem_open(sem_t *handle,unsigned init){
    if(handle==nullptr)return -1;
    do_syscall(0x21,(uint64)handle,init);
    int volatile ret=(int)RISCV::r_a0();
    return ret;
}

int sem_close(sem_t handle){
    if(handle==nullptr)return -1;
    do_syscall(0x22,(uint64)handle);
    int volatile ret=(int)RISCV::r_a0();
    return ret;
}

int sem_wait(sem_t id){
    if(id==nullptr)return -1;
    do_syscall(0x23,(uint64)id);
    int volatile ret=(int)RISCV::r_a0();
    return ret;
}

int sem_signal(sem_t id){
    if(id==nullptr)return -1;
    do_syscall(0x24,(uint64)id);
    int volatile ret=(int)RISCV::r_a0();
    return ret;
}

int time_sleep(time_t time){
    if(time<=0)return -1;
    do_syscall(0x31,(size_t)time);
    return 0;
}

char getc(){
    do_syscall(0x41);
    char volatile ret=(char)RISCV::r_a0();
    return ret;
}
void putc(char c){
    do_syscall(0x42,c);
}