#!/bin/bash

echo "⏳ Esperando a que Seafile esté listo..."
sleep 45

echo "🔧 Configurando OnlyOffice en Seafile..."

# Verificar si ya existe la configuración
if sudo docker exec seafile grep -q "ENABLE_ONLYOFFICE" /opt/seafile/conf/seahub_settings.py 2>/dev/null; then
    echo "⚠️  OnlyOffice ya está configurado"
else
    # Agregar configuración de OnlyOffice
    sudo docker exec seafile bash -c "cat >> /opt/seafile/conf/seahub_settings.py << 'EOF'

# OnlyOffice Configuration
ENABLE_ONLYOFFICE = True
VERIFY_ONLYOFFICE_CERTIFICATE = False
ONLYOFFICE_APIJS_URL = 'https://docs.openpyme.mx/web-apps/apps/api/documents/api.js'
ONLYOFFICE_FILE_EXTENSION = ('doc', 'docx', 'ppt', 'pptx', 'xls', 'xlsx', 'odt', 'fodt', 'odp', 'fodp', 'ods', 'fods', 'csv', 'ppsx', 'pps')
ONLYOFFICE_EDIT_FILE_EXTENSION = ('docx', 'pptx', 'xlsx')
ONLYOFFICE_JWT_SECRET = 'my_secret'
EOF"

    echo "🔄 Reiniciando Seafile..."
    sudo docker restart seafile
    
    echo "✅ OnlyOffice configurado correctamente"
    echo "📱 Accede a: http://drive.openpyme.mx"
    echo "👤 Usuario: admin@openpyme.mx"
    echo "🔑 Contraseña: admin123"
fi
