# Seafile 
## Seafile con Docker - OpenPyme

Instalación de Seafile usando Docker Compose para el servidor de OpenPyme, con integración a OnlyOffice.

## 📋 Requisitos Previos

- Docker instalado
- Docker Compose instalado
- Puerto 7024 disponible
- OnlyOffice corriendo en http://192.168.122.55:8000

## 🏗️ Estructura del Proyecto
/home/openpyme/seafile/
├── docker-compose.yml
├── README.md
├── db/ (creado automáticamente)
└── data/ (creado automáticamente)


## 🚀 Instalación

1. Ingresa al directorio openpyme
   ```bash
   cd /home/openpyme/
   ```
3. clona el proyecto desde Github
   ```bash
   git clone https://github.com/Roxan15/seafile.git
   ```
4. Revisar que se haya creado el repositorio
   ```bash
   ls
   ```
5. Acceder a la carpeta seafile
   ```bash
   cd seafile
   ```
6. Verificar que exista el archivo docker_compose.yaml
7. Levantar el docker
   sudo docker compose up -d
8. Acceder al sitio web para comenzar a gestionarlo
   http://192.168.122.55:7024
Espera 2-3 minutos para que se complete la inicialización.

## 🔐 Credenciales de Acceso
Seafile Web Interface
  - URL: http://192.168.122.55:7024
  - Usuario: admin@openpyme.mx
  - Contraseña: admin123

Base de Datos MySQL
  - Root Password: mysql123
  - Seafile DB Password: seafiledb123

Redis
  - Password: redis123

JWT
  - Private Key: jwt123456

