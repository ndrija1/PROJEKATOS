//
// Created by os on 10/9/25.
//

#include "../h/MemoryAllocator.hpp"

MemoryAllocator::FreeBlock* MemoryAllocator::freeListHead = nullptr;


void MemoryAllocator::initialize() {
    if (freeListHead) return; // prevent reinitialization

    freeListHead = (FreeBlock*)HEAP_START_ADDR;
    *freeListHead = {
            nullptr,
            ((size_t)(HEAP_END_ADDR) - (size_t)(HEAP_START_ADDR) - sizeof(FreeBlock)) / MEM_BLOCK_SIZE
    };
}

void* MemoryAllocator::mem_alloc(size_t size) {
    if (!freeListHead || size == 0) return nullptr;

    size_t totalBytes = size + sizeof(FreeBlock);
    size_t blocksNeeded = (totalBytes / MEM_BLOCK_SIZE) + (totalBytes % MEM_BLOCK_SIZE == 0 ? 0 : 1);

    FreeBlock* current_prev = nullptr;
    FreeBlock* current_block = freeListHead;

    FreeBlock* best_fit_prev = nullptr;
    FreeBlock* best_fit_block = nullptr;

    // Best-fit search: Find the smallest block that is large enough.
    while (current_block) {
        if (current_block->sizeInBlocks >= blocksNeeded) {
            if (!best_fit_block || current_block->sizeInBlocks < best_fit_block->sizeInBlocks) {
                best_fit_block = current_block;
                best_fit_prev = current_prev;
            }
        }
        current_prev = current_block;
        current_block = current_block->next;
    }

    // If a suitable block was found, allocate from it.
    if (best_fit_block) {
        size_t remainingBlocks = best_fit_block->sizeInBlocks - blocksNeeded;

        if (remainingBlocks > 0) {
            // The block is larger than needed, so split it.
            // Create a new free block from the remaining space.
            FreeBlock* newFreeBlock = (FreeBlock*)((char*)best_fit_block + blocksNeeded * MEM_BLOCK_SIZE);
            newFreeBlock->sizeInBlocks = remainingBlocks;
            newFreeBlock->next = best_fit_block->next;

            // Link the new free block into the list.
            if (best_fit_prev) {
                best_fit_prev->next = newFreeBlock;
            } else {
                // The best-fit block was the head of the list.
                freeListHead = newFreeBlock;
            }
            // Update the size of the allocated block.
            best_fit_block->sizeInBlocks = blocksNeeded;
        } else {
            // The block is exactly the right size, so just remove it from the list.
            if (best_fit_prev) {
                best_fit_prev->next = best_fit_block->next;
            } else {
                // The best-fit block was the head of the list.
                freeListHead = best_fit_block->next;
            }
        }
        // Return a pointer to the usable memory area (after the header).
        return (void*)(best_fit_block + 1);
    }

    // No suitable block found.
    return nullptr;
}

int MemoryAllocator::mem_free(void *ptr) {
    if (!ptr) return -1;
    if (ptr < HEAP_START_ADDR || ptr >= HEAP_END_ADDR) return -1;


    FreeBlock* curr = freeListHead;
    FreeBlock* prev = nullptr;
    FreeBlock* free_blk = reinterpret_cast<FreeBlock*>(ptr) - 1;


    //The whole address space was allocated
    if (!curr) {
        freeListHead = free_blk;
        free_blk->next = nullptr;
        return 0;
    }
    if (free_blk < curr) {
        free_blk->next = freeListHead;
        freeListHead = free_blk;
        mergeAdjacent(freeListHead);
        return 0;
    }

    //Insert into list in correct order
    while (curr != nullptr && free_blk > curr) {
        prev = curr;
        curr = curr->next;
    }
    if (curr == nullptr) {
        prev->next = free_blk;
        free_blk->next = nullptr;
        mergeAdjacent(prev);
        return 0;
    }
    prev->next = free_blk;
    free_blk->next = curr;
    mergeAdjacent(free_blk);
    mergeAdjacent(prev);
    return 0;
}

//Implementation was taken from "OS1 KLK2 SEPT2015 2"
void MemoryAllocator::mergeAdjacent(FreeBlock* block) {
    if (!block || !block->next) return;

    if (block->next && (char*)block + block->sizeInBlocks * MEM_BLOCK_SIZE == (char*)block->next) {
            // remove the fragment->next
            block->sizeInBlocks += block->next->sizeInBlocks;
            block->next = block->next->next;
    } else return;
}

size_t MemoryAllocator::mem_get_largest_free_block() {
    FreeBlock *ptr=freeListHead;
    size_t max_size=0;
    while (ptr) {
        if (ptr->sizeInBlocks>max_size) {
            max_size=ptr->sizeInBlocks;
        }
        ptr=ptr->next;
    }
    return max_size*MEM_BLOCK_SIZE;
}
size_t MemoryAllocator::mem_get_free_space() {
    FreeBlock *ptr=freeListHead;
    size_t space=0;
    while (ptr) {
        space+=ptr->sizeInBlocks;
        ptr=ptr->next;
    }
    return space*MEM_BLOCK_SIZE;
}

bool MemoryAllocator::isInitialized() {
    return freeListHead != nullptr;
}