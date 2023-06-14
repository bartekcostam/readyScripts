#!/bin/bash

# Aktualizacja repozytoriów
sudo apt-get update

# Instalacja nginx
sudo apt-get install -y nginx

# Utworzenie pliku konfiguracyjnego dla nginx
sudo bash -c 'cat > /etc/nginx/sites-available/reverse-proxy.conf << EOL
server {
    listen 80;

    location /test {
        proxy_pass http://localhost:3000;
    }

    location /app {
        proxy_pass http://localhost:8000;
    }
}
EOL'

# Usunięcie domyślnej konfiguracji
sudo rm /etc/nginx/sites-enabled/default

# Aktywacja nowej konfiguracji
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/

# Sprawdzenie konfiguracji nginx
sudo nginx -t

# Restart nginx
sudo systemctl restart nginx
