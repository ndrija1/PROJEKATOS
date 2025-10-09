//
// Created by os on 10/7/25.
//

#ifndef PROJECT_BASE_V1_1_PRINT_HPP
#define PROJECT_BASE_V1_1_PRINT_HPP
#include "../lib/hw.h"

extern "C" uint64 copy_and_swap(uint64 &lock, uint64 expected, uint64 desired);

void printStringS(char const *string);

void printString(char const *string);

void printIntS(int xx, int base=10, int sgn=0);

void printInt(int xx, int base=10, int sgn=0);

int stringToInt(const char *s);

char* getString(char *buf, int max);

#endif //PROJECT_BASE_V1_1_PRINT_HPP