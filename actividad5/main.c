#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

void *thread_function(void *arg) {
    printf("Hola, soy un hilo!\n");
    return NULL;
}

int main() {
    pid_t pid;
    pthread_t tid;
    
    // Contadores para procesos y hilos
    int process_count = 0;
    int thread_count = 0;
    
    pid = fork();
    if (pid == 0) { // proceso hijo
        process_count++;
        fork(); // Se crea un proceso hijo del proceso hijo
        pthread_create(&tid, NULL, thread_function, NULL); // Se crea un hilo
        thread_count++;
    }
    
    fork(); // Se crea otro proceso
    
    // Incrementamos los contadores en el proceso padre
    if (pid != 0) {
        process_count++;
        fork();
    }
    
    // Imprimir el número de procesos y hilos creados
    printf("Cantidad de procesos creados: %d\n", process_count);
    printf("Cantidad de hilos creados: %d\n", thread_count);
    
    // Esperar a que todos los procesos terminen
    wait(NULL);
    
    return 0;
}
