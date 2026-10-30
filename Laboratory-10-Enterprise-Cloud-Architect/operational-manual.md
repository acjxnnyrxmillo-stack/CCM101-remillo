# Operational Manual: Cloudnova WordPress Stack

Handover document for the client's IT team. It explains how to deploy, secure,
and maintain a persistent two-tier WordPress application on a Linux server.

## 1. Overview

| Item | Value |
|---|---|
| Host machine | Windows laptop |
| Hypervisor | Oracle VirtualBox (Bridged network adapter) |
| Guest OS | Ubuntu Server 26.04 LTS (`cloudnova-server`) |
| VM resources | 2 GB RAM, 2 CPUs, 25 GB disk |
| Container platform | Docker Engine and Docker Compose v2 |
| Application | WordPress (`wordpress:latest`) |
| Database | MySQL 8.0 (`mysql:8.0`) |
| Persistent storage | Docker named volume `db_data` |
| Firewall | UFW (default deny incoming) |
| Automation | Bash backup script scheduled with cron |

The architecture diagram is in `architecture-diagram.png`.

## 2. Deployment

### 2.1 Prepare the server

1. Create a VirtualBox VM and install **Ubuntu Server** (not the minimized
   image). During installation, select **Install OpenSSH server**.
2. Set the network adapter to **Bridged Adapter** so the VM receives an IP
   address on the same network as the host.
3. Log in to the VM and note its IP address:

   ```bash
   ip a
   ```

4. From the host, confirm connectivity and connect over SSH:

   ```bash
   ping <VM-IP>
   ssh architect@<VM-IP>
   ```

### 2.2 Install Docker

```bash
sudo apt update
sudo apt install -y docker.io docker-compose-v2
sudo usermod -aG docker architect
```

Log out and log in again so the group change takes effect, then verify:

```bash
docker --version
docker compose version
docker run hello-world
```

### 2.3 Deploy the stack

```bash
mkdir -p ~/lab10 && cd ~/lab10
# place docker-compose.yml in this folder
docker compose config -q      # validates the file, prints nothing if valid
docker compose pull           # downloads the images
docker compose up -d          # starts the stack in the background
docker compose ps             # both containers should show "Up"
```

### 2.4 Wait for the database, then install WordPress

MySQL needs time to initialize on first start (30 to 90 seconds on a 2 GB VM).
Do not open WordPress until the database is ready:

```bash
docker compose logs db | grep -i "ready for connections"
```

Wait until the **second** matching line shows `port: 3306`. Then open
`http://<VM-IP>` in a browser and complete the WordPress setup.

## 3. Stack design

`docker-compose.yml` defines two linked services:

- **db** (`mysql:8.0`): stores data in the `db_data` volume mounted at
  `/var/lib/mysql`. Port 3306 is not published to the host, so it is reachable
  only from other containers on the internal Compose network.
- **wordpress** (`wordpress:latest`): publishes port 80, connects to the
  database through the hostname `db:3306`, and starts after `db`
  (`depends_on`).

Both services use `restart: always`, so they come back automatically after a
VM reboot.

**Persistence:** because the database lives in the named volume `db_data`,
the data survives `docker compose down` and `docker compose up -d`. This was
verified by creating a draft post, restarting the stack, and confirming the
post still existed without reinstalling WordPress.

## 4. Security

### 4.1 Firewall (UFW)

Apply the rules in this order. Allow SSH **before** enabling the firewall, or
the remote session will be lost.

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp      # SSH
sudo ufw allow 80/tcp      # HTTP (WordPress)
sudo ufw enable
sudo ufw status verbose
```

Expected result: `Status: active`, `Default: deny (incoming), allow
(outgoing)`, and only ports 22 and 80 allowed (IPv4 and IPv6).

### 4.2 Additional measures

- The MySQL port is not exposed outside the Docker network.
- Passwords in `docker-compose.yml` are lab values only. For production, move
  them to an `.env` file that is excluded from version control, and use strong,
  unique passwords.
- Keep the system patched with `sudo apt update && sudo apt upgrade`.
- For production, place the site behind HTTPS (for example a reverse proxy
  with a TLS certificate) and consider SSH key authentication instead of
  passwords.

## 5. Automation: scheduled database backup

`automation-script.sh` creates a timestamped SQL dump of the WordPress
database, records the result in a log, and deletes backups older than 7 days.

Make it executable and test it manually:

```bash
chmod +x ~/lab10/automation-script.sh
~/lab10/automation-script.sh
cat ~/lab10/backups/backup.log
ls -l ~/lab10/backups/
```

Schedule it with cron (runs daily at 02:00):

```bash
crontab -e
```

Add this line:

```
0 2 * * * /home/architect/lab10/automation-script.sh
```

Verify with `crontab -l`. During testing, the schedule `*/2 * * * *` (every
two minutes) was used and the log showed automatic entries exactly two minutes
apart, confirming that cron executes the script.

Cron field order: minute, hour, day of month, month, day of week.

## 6. Maintenance

| Task | Command |
|---|---|
| Show container status | `docker compose ps` |
| View logs | `docker compose logs -f` |
| Restart one service | `docker compose restart wordpress` |
| Stop the stack (keeps data) | `docker compose down` |
| Start the stack | `docker compose up -d` |
| Update images | `docker compose pull && docker compose up -d` |
| Check disk usage | `df -h` and `docker system df` |
| Check firewall | `sudo ufw status verbose` |

**Warning:** `docker compose down -v` deletes the database volume and all
data. Use it only when a clean reset is intended.

### 6.1 Restore from backup

```bash
cd ~/lab10
docker exec -i lab10-mysql sh -c 'mysql -uroot -p"$MYSQL_ROOT_PASSWORD" wordpress' < backups/<backup-file>.sql
```

## 7. Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| "Error establishing a database connection" right after `up -d` | MySQL is still initializing | Wait 1 to 2 minutes and refresh. Check `docker compose logs db` for `ready for connections` on port 3306. If needed, run `docker compose restart wordpress`. |
| "One or more database tables are unavailable" after installing | WordPress installed before MySQL was fully ready, leaving incomplete tables | On a fresh site, run `docker compose down -v`, then `docker compose up -d`. Wait for the database to be ready, then install again. |
| `permission denied ... docker.sock` | User is not in the `docker` group | `sudo usermod -aG docker <user>`, then log out and back in. |
| SSH stops working after enabling UFW | Port 22 was not allowed first | Use the VM console, run `sudo ufw allow 22/tcp`. |
| Cron job does not run | Wrong path or script not executable | Use the absolute path in crontab, run `chmod +x`, and check `systemctl status cron`. |
| Downloads are very slow or time out | Slow mirror or network | Retry, switch network, or use a different Ubuntu mirror. Already downloaded packages are cached. |
| VM IP address changed | Bridged adapter received a new DHCP lease | Run `ip a` in the VM console and use the new address. |

## 8. Repository contents

```
Laboratory-10-Enterprise-Cloud-Architect/
├── README.md
├── architecture-diagram.png
├── docker-compose.yml
├── automation-script.sh
├── operational-manual.md
└── final-reflection.md
```
