**Laboratory Activity 4: Mission 4-The Cloud Native Engineer**

**Mission Overview**

This laboratory activity explores the shift from traditional Virtual Machines (VMs) to containerization using Docker. Using KillerCoda playground, I deployed a live Nginx web server inside a Docker container, practiced fundamental docker CLI commands, and documented the entire process as part of my Cloud Computing Portfolio

**Objectives**

- Differentiate between traditional Virtual Mchines (VMs) and Containers
- Access a Docker-enabled cloud environment usng KillerCoda
- Execute fundamental Docker CLI commands
- Pull, runs, manage, and terminate a containerized application (Nginx)
- Create professionals technical documentation using Markdown
- Continue developing a well-organized GitHub Cloud Computing Portfolio

  **Docker Commands Executed**

- 'docker --version' — Checked the installed Docker version
- 'docker info' — Displayed detailed information about the Docker environment
- 'docker pull nginx' — Downloaded the official Nginx image from Docker Hub
- 'docker run -d -p 8080:80 --name my-nginx nginx' — Ran the Nginx container in detached mode, mapping host port 8080 to container port 80
- 'curl http://localhost:8080' — Verified the Nginx web server was running
- 'docker ps' — Listed running containers
- 'docker stop my-nginx' — Stopped the running container
- 'docker ps -a' — Verified the container had stopped
- 'docker rm my-nginx' — Removed the container completely

  **Skilled Learned**

  - Understanding the architecture differences between VMs and containers
  - Navigating a cloud-based Linux terminal environment (KillerCoda)
  - Using the docker CLI to pull, run, and manage containers
  - Verifying a running web server using curl
  - Managing the full lifecycle of a container , from creation to removel
  - Writing clear technical documentation in Markdown

  **Challenges Encountered**

  -Initially had trouble creating the subfolder structure on GitHub,
