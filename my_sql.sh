#!/bin/bash

# Update package lists
sudo apt-get update

# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y install mysql-server

# Make MySQL accept connections from outside
sudo sed -i 's/bind-address/bind-address = 0.0.0.0#/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Allow root access from any host
sudo mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# Create a new user that can connect from outside
sudo mysql -uroot -proot -e "CREATE USER 'user'@'%' IDENTIFIED BY 'password'; GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# Restart MySQL Service
sudo service mysql restart

# Save credentials to a file
echo "MySQL setup completed. Here are the credentials:
Username: user
Password: password" > mysql_credentials.txt

echo "Credentials saved to mysql_credentials.txt"
