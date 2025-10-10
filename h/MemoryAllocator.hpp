//
// Created by os on 10/9/25.
//

#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#include "../lib/hw.h"
class MemoryAllocator {
public:
    static void* mem_alloc(size_t size);
    static int mem_free(void* startAddr);
    static void Initialize();

    static size_t mem_get_free_space();//returns in bytes
    static size_t mem_get_largest_free_block();//returns in bytes

private:
    struct FreeMemBlk {
        FreeMemBlk* next;
        size_t size; // size in blocks
    };
    static FreeMemBlk* freeMemHead;
    static void merge(FreeMemBlk* f);

};
#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP