# Actividad 4 - 202006629

## Funcionamiento participant1.sh

### Creación del Named Pipe:
- Al inicio, el script verifica si el Named Pipe (/tmp/chat_pipe) ya existe. Si no existe, lo crea utilizando mkfifo. 
### Manejo de Señales (trap):
- El script utiliza trap para manejar la señal de salida (EXIT), lo que asegura que el Named Pipe se elimine adecuadamente antes de salir.
### Loop Principal:
- El bucle principal se encarga de enviar y recibir mensajes en ambos sentidos.
- El usuario ingresa un mensaje que se guarda en la variable message.
- El script escribe ese mensaje en el Named Pipe, que está siendo escuchado por el receptor.

```
read -p "Tú: " message
echo "$message" > $PIPE_PATH
```
- Luego, el script lee un mensaje del Named Pipe, que fue enviado por el receptor, y lo muestra en la pantalla.

```
if read -r received_message < $PIPE_PATH; then
    echo "Otro usuario: $received_message"
fi
```

### Salida del chat:
- Si el usuario presiona Ctrl+C, el trap se activa, eliminando el Named Pipe y finalizando el script.

## Funcionamiento Particiopant2.sh

### Creación del Named Pipe:

- Al igual que el script del emisor, este verifica y crea el Named Pipe si no existe.

### Manejo de Señales (trap):

- Al igual que el script del emisor, utiliza trap para manejar la señal de salida (EXIT) y eliminar el Named Pipe correctamente al salir.

### Loop principal:

- Al igual que el script del emisor, el bucle principal se encarga de enviar y recibir mensajes en ambos sentidos.
- El script primero lee un mensaje del Named Pipe, que fue enviado por el emisor, y lo muestra en la pantalla.

```
if read -r received_message < $PIPE_PATH; then
    echo "Otro usuario: $received_message"
```
- Luego, el usuario ingresa un mensaje que se guarda en la variable message.
- El script escribe ese mensaje en el Named Pipe, que está siendo escuchado por el emisor.


```
read -p "Tú: " message
echo "$message" > $PIPE_PATH
```

### Salida del chat:
- Al presionar Ctrl+C, el trap se activa, eliminando el Named Pipe y finalizando el script.


