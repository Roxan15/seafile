# Seafile con Docker - OpenPyme

Instalación de Seafile usando Docker Compose para el servidor de OpenPyme, con integración a OnlyOffice.

## 📋 Requisitos Previos

- Docker instalado
- Docker Compose V2 (incluido con Docker)
- Puerto 7024 disponible
- OnlyOffice corriendo en http://docs.openpyme.mx

## 🏗️ Estructura del Proyecto
```
seafile/
├── docker-compose.yaml
├── install.sh
├── setup-onlyoffice.sh
├── README.md
├── .gitignore
├── db/ (creado automáticamente)
└── data/ (creado automáticamente)
```
## 🚀 Instalación

### Instalación Rápida (Recomendada)
# 1. Clonar el repositorio
```bash
git clone https://github.com/Roxan15/seafile.git
cd seafile
```

# 2. Ejecutar instalador automático
```bash
chmod +x install.sh
./install.sh
```

### Instalación Manual
# 1. Clonar el repositorio
```bash
git clone https://github.com/Roxan15/seafile.git
cd seafile
```

# 2. Dar permisos a los scripts
```bash
chmod +x install.sh setup-onlyoffice.sh
```

# 3. Levantar los contenedores
```bash
sudo docker compose up -d
```

# 4. Esperar 2-3 minutos y configurar OnlyOffice
```bash
./setup-onlyoffice.sh
```

🔐 Credenciales de Acceso
Seafile Web Interface
   
   - URL: http://drive.openpyme.mx
   - Usuario: admin@openpyme.mx
   - Contraseña: admin123
Base de Datos MySQL
   - Root Password: mysql123
   - Seafile DB Password: seafiledb123

Redis   
   - Password: redis123
JWT
   - Private Key: jwt123456

⚙️ Configuración de OnlyOffice
La integración con OnlyOffice se configura automáticamente con el script ```setup-onlyoffice.sh```.

Si necesitas configurarla manualmente:

   - Document Server URL: ```http://docs.openpyme.mx/```
   - JWT Secret: ```my_secret```
