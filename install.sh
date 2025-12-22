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
    echo "Instala Docker con: sudo dnf install docker-ce docker-ce-cli containerd.io -y"
    exit 1
fi

# Verificar que Docker esté corriendo
if ! sudo docker info &> /dev/null; then
    echo "❌ Error: Docker no está corriendo"
    echo "Inicia Docker con: sudo systemctl start docker"
    exit 1
fi

# Verificar Docker Compose (V2)
if ! sudo docker compose version &> /dev/null; then
    echo "❌ Error: Docker Compose no está disponible"
    exit 1
fi

echo "✅ Docker y Docker Compose detectados correctamente"
echo ""

# Dar permisos al script de OnlyOffice
echo "🔐 Configurando permisos..."
chmod +x setup-onlyoffice.sh

# Levantar servicios
echo "📦 Levantando contenedores Docker..."
sudo docker compose up -d

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
echo "📱 URL de acceso: http://drive.openpyme.mx"
echo "👤 Usuario: admin@openpyme.mx"
echo "🔑 Contraseña: admin123"
echo ""
echo "📋 Comandos útiles:"
echo "  Ver logs:        sudo docker logs -f seafile"
echo "  Estado:          sudo docker compose ps"
echo "  Reiniciar:       sudo docker compose restart"
echo "  Detener:         sudo docker compose stop"
echo "  Eliminar todo:   sudo docker compose down -v"
echo ""
