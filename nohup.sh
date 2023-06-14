#!/bin/bash


# Nadanie uprawnień do wykonania dla skryptów
chmod +x apache_server.sh
chmod +x my_sql.sh
chmod +x nginx_server.sh

# Uruchomienie skryptu setup_apache.sh w tle
nohup bash apache_server.sh > setup_apache.log 2>&1 &

# Czekanie na zakończenie skryptu setup_apache.sh
wait $!

# Uruchomienie skryptu setup_mysql.sh w tle
nohup bash my_sql.sh > setup_mysql.log 2>&1 &

# Czekanie na zakończenie skryptu setup_mysql.sh
wait $!

# Uruchomienie skryptu setup_nginx.sh w tle
nohup bash nginx_server.sh > setup_nginx.log 2>&1 &

# Czekanie na zakończenie skryptu setup_nginx.sh
wait $!

echo "Wszystkie skrypty zostały wykonane."
