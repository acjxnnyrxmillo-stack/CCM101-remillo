# Final Reflection: From Mission 1 to Mission 10

## 1. The Beginning
When I started Mission 1, my understanding of cloud computing was limited to
the basics, especially storage: how data is kept and why it is placed in the
cloud instead of only on a personal computer. I did not yet know how cloud
infrastructure is actually built and operated.

## 2. The Most Challenging Part
The hardest part for me was working with Docker. Errors appeared from time to
time, and they could not be fixed by simply copying code. I had to read the
error messages, think through what was wrong, and decide what needed to be
changed for the configuration to work.

Mission 10 gave me real examples of this:

- **Database errors in WordPress.** After starting the stack, WordPress showed
  "Error establishing a database connection", and later "One or more database
  tables are unavailable". I found that MySQL was still initializing on first
  start, and I had installed WordPress too early. I fixed it by resetting the
  stack with `docker compose down -v`, waiting until the logs showed `ready
  for connections` on port 3306, and installing again.
- **Permission denied on Docker.** My user was not in the `docker` group, so
  I added it with `usermod` and logged in again.
- **Slow downloads.** Package downloads were very slow, so I learned to skip
  the unnecessary full system upgrade, install only what the project needed,
  and use a second terminal tab to continue working while images downloaded.
- **Copying files from the server.** `scp` failed because of a trailing
  backslash in a Windows path. Using the current folder as the destination
  solved it.

These problems taught me that troubleshooting is a core part of an engineer's
job.

## 3. What I Learned
My knowledge grew significantly because I explored several tools:

- **Linux:** using the command line, installing Ubuntu Server on a virtual
  machine, and accessing it remotely through SSH.
- **Docker and Docker Compose:** running applications in containers, linking
  WordPress and MySQL, and using a named volume so the database survives
  restarts. I tested this by creating a post, restarting the stack, and
  confirming the post was still there.
- **Security with UFW:** setting the default policy to deny incoming traffic
  and allowing only SSH (22) and HTTP (80). I learned to allow SSH before
  enabling the firewall so I would not lock myself out.
- **Automation:** writing a Bash script that backs up the database and
  scheduling it with cron. I confirmed cron worked when the log showed
  automatic entries every two minutes, then changed the schedule to daily.
- **GitHub and documentation:** organizing my work in a portfolio, writing an
  operational manual, and drawing an architecture diagram so someone else can
  understand and maintain what I built.

## 4. Applying This in the Future
I will use these skills whenever my work requires them. Even if I do not use
them right away, I will keep this knowledge, because understanding how cloud
services, containers, firewalls, and automation work is valuable in any area
of IT.

## 5. Closing Thoughts
Mission 10 gave me the chance to combine everything I learned in the earlier
missions. Starting from a basic understanding of storage, I learned to build,
secure, automate, and document my own infrastructure.
