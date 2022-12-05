https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){  
    /* Define parallel region */
    #pragma omp parallel
    {    
        int thread_id;
        /* Use the OpenMP API to query which thread we are in */
        thread_id = omp_get_thread_num();
        printf("Hello World from thread: %d\n", thread_id);
       
        /* Ensure all threads have printed before continuing */
        #pragma omp barrier
        /* Action only from the thread with ID 0 */
        if (thread_id == 0){
            /* Print the total the total number of threads */
            printf("Total number of threads: %d\n", omp_get_num_threads());
        }
    }

    return 0;
} 
