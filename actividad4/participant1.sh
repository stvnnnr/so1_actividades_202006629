#!/bin/bash

PIPE_PATH="/tmp/chat_pipe"

# Verificar si el pipe ya existe
if [[ ! -p $PIPE_PATH ]]; then
    mkfifo $PIPE_PATH
fi

# Definir función para manejar la señal de salida (Ctrl+C)
cleanup() {
    rm -f $PIPE_PATH
    echo "Saliendo del chat."
    exit 0
}

trap cleanup EXIT

# Loop principal para enviar y recibir mensajes
while true; do
    # Enviar mensaje
    read -p "Tú: " message
    echo "$message" > $PIPE_PATH
    
    # Recibir mensaje
    if read -r received_message < $PIPE_PATH; then
        echo "Otro usuario: $received_message"
    fi
done