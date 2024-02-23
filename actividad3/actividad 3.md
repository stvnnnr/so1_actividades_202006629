# Crear un servicio systemd para imprimir saludos y fecha actual

## 1. Crea el script

Crea un script llamado `print_date.sh` con el siguiente contenido:

```bash
#!/bin/bash
while true
do
    echo "Hola, la fecha actual es: $(date)"
    sleep 1
done
```

Guarda el script en `/usr/local/bin/print_date.sh` y asegúrate de que tenga permisos de ejecución (`chmod +x /usr/local/bin/print_date.sh`).

## 2. Crea el archivo de unidad de systemd

Crea un archivo llamado `print_date.service` en `/etc/systemd/system/` con el siguiente contenido:

```plaintext
[Unit]
Description=Imprime saludos y fecha actual

[Service]
Type=simple
ExecStart=/usr/local/bin/print_date.sh

[Install]
WantedBy=multi-user.target
```

## 3. Habilita el servicio para iniciar con el sistema

Ejecuta el siguiente comando para habilitar el servicio:

```bash
sudo systemctl enable print_date.service
```

## 4. Inicia el servicio

Puedes iniciar el servicio manualmente con el siguiente comando:

```bash
sudo systemctl start print_date.service
```

## 5. Detener el servicio

Para detener el servicio, utiliza el siguiente comando:

```bash
sudo systemctl stop print_date.service
```

## 6. Deshabilitar el servicio

Si deseas deshabilitar el servicio para que no se inicie automáticamente al arrancar el sistema, ejecuta:

```bash
sudo systemctl disable print_date.service
```

## Verificar logs del servicio

Puedes verificar los logs del servicio utilizando el comando `journalctl`:

```bash
sudo journalctl -u print_date.service
```

Con esto, deberías tener un servicio systemd funcionando que imprima saludos y la fecha actual infinitamente.