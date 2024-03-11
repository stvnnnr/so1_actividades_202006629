a) ¿Cuántos procesos únicos son creados?

Para contar los procesos únicos, debemos tener en cuenta que cada vez que se llama a fork(), se crea un nuevo proceso. En el código proporcionado, fork() se llama tres veces dentro del bloque if (pid == 0), y una vez fuera de él. Así que, en total, se crearán 4 procesos únicos.

b) ¿Cuántos hilos únicos son creados?

En el código, solo se crea un hilo dentro del bloque if (pid == 0). Entonces, solo se crea un hilo único.