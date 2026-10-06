# Docker Compose Guide: Nextcloud Deployment

This guide explains the 'docker-compose.yml' file used to deploy cloud storage system with a MariaDB database.

# The Compose file

```yaml
version: '3'

services:
  database:
    image: mariadb:10.6
    environment:
      - MYSQL_ROOT_PASSWORD=cloudnova_root
      - MYSQL_PASSWORD=cloudnova_pass
      - MYSQL_DATABASE=nextcloud_db
      - MYSQL_USER=nextcloud_user

  app:
    image: nextcloud
    ports:
      - 8080:80
    environment:
      - MYSQL_PASSWORD=cloudnova_pass
      - MYSQL_DATABASE=nextcloud_db
      - MYSQL_USER=nextcloud_user
      - MYSQL_HOST=database
```

# What does the 'service:' block do?

The 'services:' block lists every container that makes up the application. Each entry under it (here, 'database' and 'app') defines one container: which image to use, which ports to publish, and which environment variables to pass. Docker Compose reads this block and creates, networks, and starts all of the containers together as one stack.

# How did the Nextcloud container find the database?

The 'app' container uses the environment variable 'MYSQL_HOST=database'. The value 'database' is the name of the other service in the compose file. Docker compose automatically puts all services on the same private network and lets them reach each other by service name, so database resolves to the mariandb container's address.

# docker run vs. docker-compose up -d

| | docker run | docker-compose up -d |
|---|---|---|
|Scope | Starts one container per command | Starts the whole multi-container stack |
| Configuration | Options typed manually as flags | Defined in a reusable YAML file |
Networking | Containers must be linked or networked manually | Shared network is create automatically |
| Repeatability | Easy to make typing mistakes | Same result every time from the same file |
| Cleanup | Stop and remove each container separately | Docker-compose down remove everything |
