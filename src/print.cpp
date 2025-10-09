//
// Created by os on 10/7/25.
//
#include "../h/print.hpp"

#include "../h/RISCV.hpp"
#include "../lib/console.h"
void printStringS(char const *string)
{
    uint64 sstatus=RISCV::r_sstatus();
    RISCV::mc_sstatus(RISCV::SSTATUS_SIE);
    while (*string != '\0')
    {
        __putc(*string);
        string++;
    }
    RISCV::ms_sstatus(sstatus & RISCV::SSTATUS_SIE ? RISCV::SSTATUS_SIE : 0);
}

void printIntS(uint64 integer)
{
    uint64 sstatus=RISCV::r_sstatus();
    RISCV::mc_sstatus(RISCV::SSTATUS_SIE);
    char digits[] = "0123456789";
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(integer < 0){
        neg = 1;
        x = -integer;
    } else {

        x = integer;
    }

    i = 0;
    do{
        buf[i++] = digits[x % 10];
    }while((x /= 10) != 0);
    if(neg)
        buf[i++] = '-';

    while(--i >= 0)
        __putc(buf[i]);
    RISCV::ms_sstatus(sstatus&RISCV::SSTATUS_SIE ? RISCV::SSTATUS_SIE : 0);


}