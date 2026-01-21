#!/bin/bash

echo "⏳ Esperando a que Collabora esté listo..."
sleep 30

echo "🔧 Configurando Collabora en Seafile..."

# Eliminar configuración de OnlyOffice
sudo docker exec seafile sed -i '/# OnlyOffice Configuration/,/ONLYOFFICE_JWT_SECRET/d' /opt/seafile/conf/seahub_settings.py

# Agregar configuración de Collabora
sudo docker exec seafile bash -c "cat >> /opt/seafile/conf/seahub_settings.py << 'EOF'

# Collabora Online Configuration
ENABLE_OFFICE_WEB_APP = True
OFFICE_WEB_APP_BASE_URL = 'http://192.168.122.55:9980'
WOPI_ACCESS_TOKEN_EXPIRATION = 1800
OFFICE_WEB_APP_FILE_EXTENSION = ('odp', 'ods', 'odt', 'xls', 'xlsb', 'xlsm', 'xlsx','ppsx', 'ppt', 'pptm', 'pptx', 'doc', 'docm', 'docx')
OFFICE_WEB_APP_EDIT_FILE_EXTENSION = ('odp', 'ods', 'odt', 'xls', 'xlsb', 'xlsm', 'xlsx','ppsx', 'ppt', 'pptm', 'pptx', 'doc', 'docm', 'docx')
EOF"

echo "🔄 Reiniciando Seafile..."
sudo docker restart seafile

echo "✅ Collabora configurado correctamente"
echo "📱 Accede a: http://192.168.122.55:7024"
echo "🔧 Collabora Admin: http://192.168.122.55:9980"
