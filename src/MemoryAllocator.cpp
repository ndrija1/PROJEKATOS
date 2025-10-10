//
// Created by os on 10/9/25.
//

#include "../h/MemoryAllocator.hpp"

MemoryAllocator::FreeMemBlk* MemoryAllocator::freeMemHead = nullptr;
void MemoryAllocator::Initialize() {
    freeMemHead = (FreeMemBlk*)HEAP_START_ADDR;
    *freeMemHead = {
            nullptr,
            ((size_t)(HEAP_END_ADDR) - (size_t)(HEAP_START_ADDR) - sizeof(FreeMemBlk)) / MEM_BLOCK_SIZE
    };
}

void* MemoryAllocator::mem_alloc(size_t size) {
    void* new_blk = nullptr;

    size_t needed_size = size + sizeof(FreeMemBlk);
    size_t size_in_blk = (needed_size / MEM_BLOCK_SIZE) + (needed_size % MEM_BLOCK_SIZE == 0 ? 0 : 1);
    
    
    if (!freeMemHead) return nullptr;

    
    FreeMemBlk* prev = nullptr;
    FreeMemBlk* curr = freeMemHead;

    //First-fit
    while (curr) {
        if (curr->size >= size_in_blk) {  //Found a big enough fragment
            //Remove it from the free fragments linked list
            if (!prev) { //It's the first element in the list
                if (curr->size - size_in_blk > 0) {
                    //Shrink the fragment
                    freeMemHead = curr + size_in_blk * MEM_BLOCK_SIZE;
                    freeMemHead->size = curr->size - size_in_blk;
                    freeMemHead->next = curr->next;
                    curr->size = size_in_blk; //Update the new fragment size
                }
                else {
                    freeMemHead = freeMemHead->next;
                }
                new_blk = curr;
            }
            else if (!curr->next) { //It's the last element in the list
                if (curr->size - size_in_blk > 0) {
                    //Shrink the fragment
                    FreeMemBlk* newFreeFragmentAddr = curr + size_in_blk * MEM_BLOCK_SIZE;
                    prev->next = newFreeFragmentAddr;
                    newFreeFragmentAddr->size = curr->size - size_in_blk;
                    newFreeFragmentAddr->next = curr->next;
                    curr->size = size_in_blk; //Update the new fragment size
                }
                else {
                    prev->next = nullptr;
                }
                new_blk = curr;
            }
            else {
                if (curr->size - size_in_blk > 0) {
                    // shrink the fragment
                    FreeMemBlk* newFreeFragmentAddr = curr + size_in_blk * MEM_BLOCK_SIZE;
                    prev->next = newFreeFragmentAddr;
                    newFreeFragmentAddr->size = curr->size - size_in_blk;
                    newFreeFragmentAddr->next = curr->next;
                    curr->size = size_in_blk; // update the allocated fragment size
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

    return (new_blk ? ((FreeMemBlk*)new_blk + 1) : nullptr);
}

int MemoryAllocator::mem_free(void *ptr) {
    if (!ptr) return -1;

    FreeMemBlk* curr = freeMemHead;
    FreeMemBlk* prev = nullptr;
    FreeMemBlk* free_blk = (FreeMemBlk*)ptr - 1;


    if (ptr < HEAP_START_ADDR || ptr >= HEAP_END_ADDR) return -1;

    //The whole address space was allocated
    if (!curr) {
        freeMemHead = free_blk;
        free_blk->next = nullptr;
        return 0;
    }
    if (free_blk < curr) {
        free_blk->next = freeMemHead;
        freeMemHead = free_blk;
        merge(freeMemHead);
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
        merge(prev);
        return 0;
    }
    prev->next = free_blk;
    free_blk->next = curr;
    merge(free_blk);
    merge(prev);
    return 0;
}

//Implementation was taken from "OS1 KLK2 SEPT2015 2"
void MemoryAllocator::merge(FreeMemBlk* f) {
    if (!f) return;
    if (f->next && (char*)f + f->size * MEM_BLOCK_SIZE == (char*)f->next) {
            // remove the fragment->next
            f->size += f->next->size;
            f->next = f->next->next;
    } else return;
}

size_t MemoryAllocator::mem_get_largest_free_block() {
    FreeMemBlk *ptr=freeMemHead;
    size_t max_size=0;
    while (ptr) {
        if (ptr->size>max_size) {
            max_size=ptr->size;
        }
        ptr=ptr->next;
    }
    return max_size*MEM_BLOCK_SIZE;
}
size_t MemoryAllocator::mem_get_free_space() {
    FreeMemBlk *ptr=freeMemHead;
    size_t space=0;
    while (ptr) {
        space+=ptr->size;
        ptr=ptr->next;
    }
    return space*MEM_BLOCK_SIZE;
}