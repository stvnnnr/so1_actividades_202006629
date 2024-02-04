#!/bin/bash

# Obtener la directorio del script
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Verificar si se ha configurado el cronjob
# if ! crontab -l | grep -q "$script_dir"; then
#     # Agregar el cronjob
#     (crontab -l ; echo "*/5 * * * * $script_dir/consulta_github.sh") | crontab -
#     echo "Cronjob configurado para ejecutar el script cada 5 minutos."
# fi

# Obtener la fecha actual
fecha=$(date +"%Y%m%d")

# Definir la variable del usuario de GitHub
GITHUB_USER="stvnnnr"

# Verificar si la variable GITHUB_USER está vacía
if [ -z "$GITHUB_USER" ]; then
    echo "La variable GITHUB_USER no está definida. Por favor, establezca el nombre de usuario de GitHub."
    exit 1
fi

# Consultar los datos del usuario de GitHub
response=$(curl -s "https://api.github.com/users/$GITHUB_USER")

# Extraer los datos del JSON
github_user=$(echo "$response" | jq -r '.login')
id=$(echo "$response" | jq -r '.id')
created_at=$(echo "$response" | jq -r '.created_at')

# Imprimir el mensaje
echo "Hola $github_user. User ID: $id. Cuenta fue creada el: $created_at."

# Crear el directorio de logs si no existe
mkdir -p "/tmp/$fecha"

# Escribir el mensaje en el log file
echo "Hola $github_user. User ID: $id. Cuenta fue creada el: $created_at." >> "/tmp/$fecha/saludos.log"
