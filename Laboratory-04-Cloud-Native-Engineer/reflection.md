**Mission Reflection**

Docker containers boot dramatically faster than Virtual Machines. Installing an OS on a VM can take 15 minutes or more, since the hypervisor has to allocate resources and boot a full guest OS before anything runs. Deploying the Nginx container in this activity took only seconds, since docker simply pull a pre-built image and starts a process that shares the host's existing kernel. This shows why containers are ideal for fast, repeatable deployments.

Port mapping (-p 8080:80) is necessary because a container is isolated from the host's network by default. Nginx runs on port 80 inside the container, but that port is not reachable from outside unless it is mapped to a port on the host-in this case, 8080. Without this mapping, there would be no way for a browser or curl request to reach the web server running inside the container

When docker rm is used, any date stored inside the container's writable layer is permanently deleted along with the container itself. Since containers are meant to be temporary and disposable, data does not persist unless it was explicitly saved outside the container, such as through a volume or bind mount.

Containerization changes how developers and IT operations teams collaborate by removing the classic "it works on my machine" problem. Because a container packages an application with all its dependencies, developers can hand off a fully working environment to operations teams, and it behaves identically wherever deployed. This encourages closer collaboration and faster, more reliable release cycles the core idea behind DevOps.

This activity is another step forward in my GitHub Cloud Computing portfolio. After documenting multi-cloud comparisons in a previous lab, I now have hands-on evidence of working with containerization, complete with commands, and technical documentation, strengthening my portfolio as a well-rounded cloud computing student.
