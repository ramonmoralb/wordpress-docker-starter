# Proyecto WordPress con Docker entorno local

**Requisitos**

Antes de comenzar, asegúrate de tener instalados los siguientes programas en tu máquina:

- [Docker](https://www.docker.com/get-started): Instalar Docker
- [Docker Compose](https://docs.docker.com/compose/install/): Instalar Docker Compose

**Estructura del Proyecto**

La estructura de archivos de este proyecto es la siguiente:

. ├── app/ │ ├── wp-content/ # Contenido personalizable de WordPress (temas, plugins, etc.) │ ├── wp-config.php # Configuración personalizada de WordPress │ └── wp-admin/ # Ignorado (parte del núcleo de WordPress) ├── docker-compose.yml # Configuración de los servicios Docker ├── init-db.sh # Script para importar la base de datos desde un dump ├── mysql-custom.Dockerfile # Dockerfile personalizado para MySQL ├── mysql-dump # Dump de la base de datos (opcional) └── .gitignore # Archivos y carpetas a ignorar por Git


📝 **Configuración inicial**

### Clonar el repositorio

Clona este repositorio en tu máquina local:

```bash
git clone https://tu-repositorio-url.git
cd tu-repositorio
```

# Configuración del archivo .env

Antes de iniciar, asegúrate de que tienes un archivo .env en el directorio raíz con la configuración adecuada. Puedes crear uno a partir del ejemplo .env.example (si lo tienes) y configurarlo con los valores correctos. Si no existe este archivo, asegúrate de configurarlo correctamente (lo puedes dejar vacío si no necesitas configuraciones específicas).

Ejemplo de archivo .env:

MYSQL_ROOT_PASSWORD=rootp
MYSQL_DATABASE=wordpress
MYSQL_USER=user
MYSQL_PASSWORD=userp

# Personalizar wp-config.php

Si necesitas personalizar tu archivo wp-config.php, puedes hacerlo directamente en el archivo dentro del directorio app/. Este archivo se sincroniza automáticamente con el contenedor de Docker.

## Configuración de Docker

El proyecto está configurado para ser ejecutado con Docker Compose. Esto significa que puedes iniciar todos los servicios necesarios (base de datos, WordPress, y PHPMyAdmin) con un solo comando.
Iniciar el entorno de desarrollo

**Inicia los contenedores de Docker:**
```bash
docker-compose up -d
```

Este comando levantará los siguientes servicios:

    WordPress: Accesible en http://localhost:8000

    PHPMyAdmin: Accesible en http://localhost:8080 (para gestionar la base de datos)

    MySQL: En segundo plano, manejado por Docker

## Acceder a WordPress

Una vez que los contenedores estén levantados, podrás acceder a tu instalación de WordPress desde http://localhost:8000 y configurarlo como si fuera una instalación nueva.


### Importar una base de datos (opcional)

Si tienes un dump de base de datos (db.sql), puedes importarlo a tu contenedor de MySQL utilizando el script `init-db.sh`, que se ejecutará automáticamente al iniciar el contenedor. Esto es útil si tienes una base de datos preexistente que deseas cargar.

1. Copia tu dump en el archivo `db.sql` en el directorio `./mysql-dump` en la  raíz del proyecto.


## Detener el entorno de desarrollo
Cuando termines de trabajar, puedes detener los contenedores de Docker con:
```bash
docker-compose down
```
Esto detendrá y eliminará todos los contenedores, pero mantendrá los volúmenes de datos (como la base de datos de MySQL).

## Comandos Útiles

    Ver los contenedores activos:
```bash
docker ps
```
    Ver los logs de los contenedores:
```bash
docker-compose logs
```
    Acceder al contenedor de MySQL:

```bash
docker exec -it mysql_db bash
```

    Acceder al contenedor de WordPress:
```bash
docker exec -it wordpress_app bash
```

    Reiniciar los contenedores:

```bash
docker-compose restart
```

## Limpieza

Si deseas eliminar completamente los contenedores, las redes y los volúmenes de Docker (incluida la base de datos y los archivos persistentes), puedes usar:

```bash
docker-compose down -v
```

Este comando eliminará los volúmenes asociados a tu contenedor, por lo que la base de datos y otros datos persistentes también serán eliminados.