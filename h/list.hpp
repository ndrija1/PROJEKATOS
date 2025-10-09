//
// Created by os on 9/30/25.
//

#ifndef PROJECT_BASE_V1_1_LIST_HPP
#define PROJECT_BASE_V1_1_LIST_HPP

#include "memoryAllocator.hpp"

template <typename T>
class List {
private:
    struct Elem {
        T *data;
        Elem *next;

        Elem(T *data, Elem *next):data(data),next(next){}
        void* operator new(size_t size) {
            return MemoryAllocator::mem_alloc(size);
        }

        void* operator new[](size_t size) {
            return MemoryAllocator::mem_alloc(size);
        }

        void operator delete(void *ptr) {
            MemoryAllocator::mem_free(ptr);
        }

        void operator delete[](void *ptr) {
            MemoryAllocator::mem_free(ptr);
        }
    };
    Elem *head,*tail,*curr,*prev;
public:
    List() : head(0), tail(0), curr(0), prev(0) {}

    List(const List<T> &)= delete;

    List<T> &operator=(const List<T> &)=delete;

    void addFirst(T *data) {
        Elem *el =new Elem(data,head);
        head=el;
        if (!tail){tail=head;}
    }

    void addLast(T *data) {
        Elem *el = new Elem(data,0);
        if (tail) {
            tail->next=el;
            tail=el;
        }
        else {
            head=tail=el;
        }
    }
    T *removeFIrst() {
        if (!head) return 0;

        Elem *el=head;
        head=head->next;
        if (!head) tail=0;

        T *ret=el->data;
        delete el;
        return ret;
    }

    T *peekFirst() {
        if (!head)return  0;
        return head->data;
    }

    T *removeLast() {
        if (!head)return 0;

        Elem *prev=0;
        for (Elem *cur=head;cur&&cur!=tail;cur=cur->next) {
            prev=cur;
        }
        Elem *elem=tail;
        if (prev)prev->next=0;
        else {head=0;}
        tail=prev;

        T *ret=elem->data;
        delete elem;
        return ret;
    }

    T *peekLast() {
        if (!tail)return 0;
        return tail->data;
    }
    void setFirst() {
        curr = head;
        prev = 0;
    }

    T* getCurrent() {
        if (curr) return curr->data;
        else return 0;
    }

    T* removeCurrent() {
        if (!curr) return 0;

        if (curr == head) {
            head = head->next;
            if (!head) tail = 0;
            T* ret = curr->data;
            delete curr;
            return ret;
        }

        if (curr == tail) {
            if (prev) prev->next = 0;
            else head = 0;
            tail = prev;
            T* ret = curr->data;
            delete curr;
            return ret;
        }

        T* ret = curr->data;
        prev->next = curr->next;
        delete curr;
        return ret;
    }

    void next() {
        if (curr) {
            prev = curr;
            curr = curr->next;
        }
    }
};
#endif //PROJECT_BASE_V1_1_LIST_HPP