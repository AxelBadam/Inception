# Inception - Docker Infrastructure for WordPress with Nginx and MariaDB

## Project Overview

Tailored for running a WordPress site, Nginx as a web server and reverse proxy and MariaDB for database management, all within isolated Docker containers, within a virtual machine :)

## Features

- **Custom Docker Images**: Each service is built from a custom light weigth Docker image based in Debian:bullseye.
- **Secure Communication**: Configured to use TLSv1.2 or TLSv1.3, maintaining a high standard for security.
- **Persistent Storage**: Utilizes Docker volumes for persistent storage of the WordPress database and files.
- **Automated Setup**: A Makefile is included for automating the setup of the application, simplifying the build and deployment process.
- **Network Isolation**: Custom Docker network to securely connect containers and only allow connections through the proxy.
- 
