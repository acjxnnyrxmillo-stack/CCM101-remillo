# Laboratory 06: Cloud Deployment Engineer

# Mission Overview

I deployed a multi-container private cloud storage system using Docker Compose. The stack has two tiers: a Nextcloud web/application container and a Mariadb database container. I wrote the infrastructure as a docker-compose.yml file, deployed it on a killercoda ubuntu playground, accessed the nextcloud setup page through port 8080, and then tore everything down.

# Objectives

- Explain the roles of the tiers in a multi-container architecture
- Write a properly formatted YAML file using the nano text editor
- Deploy and tear down a multi-container application with docker compose
- Route browser traffic to an application running inside a container stack
- Document infrastructure as code principles using markdown
- Keep a well-structured Github repository with evidence

# Commands Executed

```bash
mkdir nextcloud-deployment
cd nextcloud-deployment
nano docker-compose.yml
cat docker-compose.yml
docker-compose up -d
docker-compose ps
docker-compose down
```

# Skills learned

- Writing docker compose file in YAML with correct indentation
- Using nano to create and edit files from the command line
- Deploying and removing multi-container stack with one command
- Connecting container by service name using environment variables
- Publishing container ports to access an app from a browser
- Understanding two-tier architecture and why tiers are separated
- Documenting infrastructure with markdown
  
