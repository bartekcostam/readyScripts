# Ubuntu Server Setup Scripts

This repository contains a set of scripts to set up Apache, MySQL, and Nginx on an Ubuntu server. The scripts are designed to be run on a fresh Ubuntu server and will install and configure the necessary software.

## Prerequisites

- An Ubuntu server (18.04 or later)
- Root or sudo access

## Scripts

- `apache_server.sh`: This script installs Apache and configures it as a reverse proxy for two paths "/test" and "/app" on ports 3000 and 8000 respectively.
- `my_sql.sh`: This script installs MySQL, sets a password for the root user, creates a remote user with full privileges, and generates a text file with the login details.
- `nginx_server.sh`: This script installs Nginx and configures it as a reverse proxy for two paths "/test" and "/app" on ports 3000 and 8000 respectively.
- `nohup.sh`: This script uses `nohup` to run the other scripts one after the other in the background. It also automatically adds execute permissions to the other scripts.

## Usage

1. Clone this repository to your Ubuntu server:

    ```bash
    git clone https://github.com/yourusername/yourrepository.git
    ```

2. Navigate to the repository directory:

    ```bash
    cd yourrepository
    ```

3. Make the `nohup.sh` script executable:

    ```bash
    chmod +x nohup.sh
    ```

4. Run the `nohup.sh` script with sudo:

    ```bash
    sudo ./nohup.sh
    ```

After running the `nohup.sh` script, Apache, MySQL, and Nginx should be installed and configured, and you should be able to start testing or deploying your web applications. The MySQL login details will be saved in a text file named `mysql_credentials.txt`.

## Note

These scripts are intended for experimental or demonstration purposes and should not be used in production without further modifications. In particular, the passwords used in the scripts should be replaced with strong, unique passwords.
