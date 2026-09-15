**Docker Deployment - Nginx Container**

**Commands Used**
1. 'docker pull nginx' - Downloads the official Nginx image from the docker hub to the local machine.
2. 'docker run -d -p 8080:80 --name my-nginx nginx' - Runs the nginx container in detached (background) mode, mapping host port 8080 to container port 80.
3. 'curl http://localhost:8080' - Sends an http request to confirm the nginx web server is running and responding.
4. 'docker ps' - Lists all currently running containers.
5.  'docker stop my-nginx' - Stops the running my-nginx container.
6.  'docker ps -a' - Lists all containers, including stopped ones, to verify the container has exited.
7.  'docker rm my-nginx' - Permanently removes the stopped container from the system.
