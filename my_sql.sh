#!/bin/bash

# Aktualizacja repozytoriów
sudo apt-get update

# Instalacja MySQL
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

# Ustawienie hasła dla użytkownika root
mysql -u root <<-EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root_password';
FLUSH PRIVILEGES;
EOF

# Utworzenie użytkownika zdalnego
mysql -u root -proot_password <<-EOF
CREATE USER 'remote_user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'remote_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Zmiana konfiguracji MySQL, aby umożliwić zdalne połączenia
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL
sudo systemctl restart mysql

# Generowanie pliku z danymi logowania
echo "MySQL został zainstalowany." > mysql_credentials.txt
echo "Dane logowania do użytkownika root:" >> mysql_credentials.txt
echo "Użytkownik: root" >> mysql_credentials.txt
echo "Hasło: root_password" >> mysql_credentials.txt
echo "Dane logowania do użytkownika zdalnego:" >> mysql_credentials.txt
echo "Użytkownik: remote_user" >> mysql_credentials.txt
echo "Hasło: password" >> mysql_credentials.txt
