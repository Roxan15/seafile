#!/bin/bash

echo "🚀 Instalando Seafile con OnlyOffice para OpenPyme..."
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -f "docker-compose.yaml" ]; then
    echo "❌ Error: docker-compose.yaml no encontrado"
    echo "Ejecuta este script desde el directorio del proyecto"
    exit 1
fi

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "❌ Error: Docker no está instalado"
    exit 1
fi

# Verificar si Docker Compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Error: Docker Compose no está instalado"
    exit 1
fi

# Dar permisos al script de OnlyOffice
echo "🔐 Configurando permisos..."
chmod +x setup-onlyoffice.sh

# Crear directorio si no existe
sudo mkdir -p /home/openpyme/seafile

# Levantar servicios
echo "📦 Levantando contenedores Docker..."
sudo docker-compose up -d

if [ $? -ne 0 ]; then
    echo "❌ Error al levantar los contenedores"
    exit 1
fi

# Esperar a que los servicios estén listos
echo "⏳ Esperando a que los servicios inicien..."
sleep 10

# Ejecutar configuración de OnlyOffice
echo "⚙️ Configurando integración con OnlyOffice..."
./setup-onlyoffice.sh

echo ""
echo "=========================================="
echo "✅ ¡Instalación completada exitosamente!"
echo "=========================================="
echo ""
echo "📱 URL de acceso: http://192.168.122.55:7024"
echo "👤 Usuario: admin@openpyme.mx"
echo "🔑 Contraseña: admin123"
echo ""
echo "📋 Comandos útiles:"
echo "  Ver logs:        sudo docker logs -f seafile"
echo "  Estado:          sudo docker-compose ps"
echo "  Reiniciar:       sudo docker-compose restart"
echo "  Detener:         sudo docker-compose stop"
echo "  Eliminar todo:   sudo docker-compose down -v"
echo ""
