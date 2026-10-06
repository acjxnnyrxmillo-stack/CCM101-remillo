# Mission Reflection

*1. How does writing a docker-compose.yml file make a cloud engineer's job easier compared to manually typing command?*

Instead of tying a long docker run command for every container, I wrote everything once in a single file and deployed it with one command. The file also acts as documentation, because anyone can read it and see exactly what the system looks like. It can be reused, shared, and stored in Github, which means the same deployment can be repeated without mistakes.

*2. What happens if you make an indentation error (like using a tab instead of  spaces) in a YAML file?*

YAML depends on spacing to understand structure. A tab or wrong indentation can cause a parsing error, so docker compose refuses to run. Worse, it can silently change the meaning of the file. I saw this myself when 'app:' was indented too deep and became part of 'database:', so i had to fix it before deploying.

*3. Why did we use environment variable ( like MSYQL_PASSWORD) in the compose file?*

Environment variables let us configure the containers without changing the image itself. They tell MariaDB which database and user to create, and they tell nextcloud which credentials to use to connect. Since both services use matching  values, they can authenticate with each other automatically.

*4. How did it feel to deploy a fully functional enterprise cloud  storage system (nextcloud) in just a few minutes?*

It felt surprising and exciting. A system like this would normally need a lot of manual installation and configuration, but docker compose pulled the image, connected the containers, and started everything in a few minutes. Seeing the nextcloud setup page appear in my browser made the work feel real.

*5. How has your understanding of cloud computing evolved since Mission 1?*

I saw the cloud mostly as servers and storage that you use online. Now i understand that it is about building and managing system with code. Containers, networking, and infrastructure as code show how engineers deploy applications quickly, consistently, and at scale.
