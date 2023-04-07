#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    //First, checking head is NULL 
    if (head==NULL)
    {
        return 0;
    }
    //initialize 
    node *slow_ptr=head;
    node *fast_ptr=head->next;
    
    //check whether NULL is met
    while  ((fast_ptr!=NULL) && (fast_ptr->next!=NULL))
    {
        //if equal, then cyclic
        if (fast_ptr==slow_ptr)
        {
            return 1;
        }

    fast_ptr=fast_ptr->next->next;
    slow_ptr=slow_ptr->next;
    }
    //else acyclic
    return 0;   
}
