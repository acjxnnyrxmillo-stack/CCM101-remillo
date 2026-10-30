# Laboratory Activity 10: Mission 10 - Enterprise Cloud Architect

A persistent two-tier WordPress + MySQL stack running in Docker on an Ubuntu
Server VM (VirtualBox), secured with UFW and backed up by a cron-scheduled
Bash script.

## Contents
- `architecture-diagram.png`: architecture and network topology
- `docker-compose.yml`: WordPress + MySQL with a persistent volume
- `automation-script.sh`: scheduled database backup
- `operational-manual.md`: how to deploy, secure, and maintain the stack
- `final-reflection.md`: reflection from Mission 1 to Mission 10

## Quick start
    docker compose up -d
    docker compose ps

Then open `http://<server-ip>` in a browser. Wait for MySQL to report
"ready for connections" on port 3306 before installing WordPress.

Run `chmod +x automation-script.sh` after cloning, since GitHub uploads do
not preserve the executable permission.
