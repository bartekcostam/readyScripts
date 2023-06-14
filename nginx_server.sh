#!/bin/bash

# Install nginx
sudo apt-get install nginx -y

# Create a new user

sudo adduser --system --no-create-home --disabled-login --disabled-password --group nginx

