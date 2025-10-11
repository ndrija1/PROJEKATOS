//
// Created by os on 10/9/25.
//

#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#include "../lib/hw.h"

// Simple first-fit memory allocator for the kernel heap.
// Works on a linked list of free blocks (measured in MEM_BLOCK_SIZE units).

class MemoryAllocator {
public:
    // Initialize allocator over [HEAP_START_ADDR, HEAP_END_ADDR)
    static void initialize();

    // Allocate a memory block of at least `size` bytes (best-fit)
    static void* mem_alloc(size_t size);

    // Free a previously allocated block
    static int mem_free(void* startAddr);

    static size_t mem_get_free_space();//returns in bytes
    static size_t mem_get_largest_free_block();//returns in bytes

    // Initialization state
    static bool isInitialized();

    // Non-instantiable
    MemoryAllocator() = delete;
    MemoryAllocator(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;

private:
    struct FreeBlock {
        FreeBlock* next;
        size_t sizeInBlocks; // size in blocks
    };
    static FreeBlock* freeListHead;

    // Internal helper: merge adjacent free blocks
    static void mergeAdjacent(FreeBlock* block);

};
#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP