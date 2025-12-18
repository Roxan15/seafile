#!/bin/bash

echo "🚀 Instalando Seafile con OnlyOffice..."

# Verificar que estamos en el directorio correcto
if [ ! -f "docker-compose.yml" ]; then
    echo "❌ Error: docker-compose.yml no encontrado"
    echo "Ejecuta este script desde el directorio del proyecto"
    exit 1
fi

# Dar permisos al script de OnlyOffice
echo "🔐 Configurando permisos..."
chmod +x setup-onlyoffice.sh

# Levantar servicios
echo "📦 Levantando contenedores..."
sudo docker-compose up -d

# Ejecutar configuración de OnlyOffice
echo "⚙️ Configurando OnlyOffice..."
./setup-onlyoffice.sh

echo ""
echo "✅ ¡Instalación completada!"
echo ""
echo "📱 Accede a: http://192.168.122.55:7024"
echo "👤 Usuario: admin@openpyme.mx"
echo "🔑 Contraseña: admin123"
echo ""
echo "📋 Para ver logs: sudo docker logs -f seafile"
