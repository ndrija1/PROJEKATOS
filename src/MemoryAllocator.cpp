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
    

    
    FreeBlock* prev = nullptr;
    FreeBlock* curr = freeListHead;
    void* new_blk = nullptr;


    //First-fit search
    while (curr) {
        if (curr->sizeInBlocks >= blocksNeeded) {  //Found a big enough fragment
            //Remove it from the free fragments linked list
            if (!prev) { //It's the first element in the list
                if (curr->sizeInBlocks - blocksNeeded > 0) {
                    //Shrink the fragment
                    freeListHead = curr + blocksNeeded * MEM_BLOCK_SIZE;
                    freeListHead->sizeInBlocks = curr->sizeInBlocks - blocksNeeded;
                    freeListHead->next = curr->next;
                    curr->sizeInBlocks = blocksNeeded; //Update the new fragment size
                }
                else {
                    freeListHead = freeListHead->next;
                }
                new_blk = curr;
            }
            else if (!curr->next) { //It's the last element in the list
                if (curr->sizeInBlocks - blocksNeeded > 0) {
                    //Shrink the fragment
                    FreeBlock* newFreeFragmentAddr = curr + blocksNeeded * MEM_BLOCK_SIZE;
                    prev->next = newFreeFragmentAddr;
                    newFreeFragmentAddr->sizeInBlocks = curr->sizeInBlocks - blocksNeeded;
                    newFreeFragmentAddr->next = curr->next;
                    curr->sizeInBlocks = blocksNeeded; //Update the new fragment size
                }
                else {
                    prev->next = nullptr;
                }
                new_blk = curr;
            }
            else {
                if (curr->sizeInBlocks - blocksNeeded > 0) {
                    // shrink the fragment
                    FreeBlock* newFreeFragmentAddr = curr + blocksNeeded * MEM_BLOCK_SIZE;
                    prev->next = newFreeFragmentAddr;
                    newFreeFragmentAddr->sizeInBlocks = curr->sizeInBlocks - blocksNeeded;
                    newFreeFragmentAddr->next = curr->next;
                    curr->sizeInBlocks = blocksNeeded; // update the allocated fragment size
                }
                else {
                    prev->next = curr->next;
                }
                new_blk = curr;
            }
            break;
        }
        prev = curr;
        curr = curr->next;
    }

    return (new_blk ? ((FreeBlock*)new_blk + 1) : nullptr);
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