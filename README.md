# Inception - Docker Infrastructure for WordPress with Nginx and MariaDB

## Project Overview

A WordPress site with Nginx as a web server and reverse proxy, MariaDB for database - all within isolated Docker containers, all within a virtual machine :)

## Features

- **Custom Docker Images**: Each service is built from a custom light weigth Docker image based in Debian:bullseye.
- **Secure Communication**: Configured to use TLSv1.2 or TLSv1.3, maintaining a high standard for security.
- **Network Isolation**: Custom Docker network to securely connect containers and only allow connections through the proxy.
- **Persistent Storage**: Utilizes Docker volumes for persistent storage of the WordPress database and files.
- **Efficient Process Handling**: Configured PHP-FPM for site performance.
- **Automated Setup**: A Makefile is included for automating the setup of the application, simplifying the build and deployment process.
