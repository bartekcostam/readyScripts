#!/bin/bash

# Aktualizacja repozytoriów
sudo apt-get update

# Instalacja Apache
sudo apt-get install -y apache2

# Włączenie modułu proxy
sudo a2enmod proxy
sudo a2enmod proxy_http

# Utworzenie pliku konfiguracyjnego dla Apache
sudo bash -c 'cat > /etc/apache2/sites-available/000-default.conf << EOL
<VirtualHost *:80>
    ProxyPreserveHost On

    ProxyPass /test http://localhost:3000/
    ProxyPassReverse /test http://localhost:3000/

    ProxyPass /app http://localhost:8000/
    ProxyPassReverse /app http://localhost:8000/
</VirtualHost>
EOL'

# Restart Apache
sudo systemctl restart apache2
