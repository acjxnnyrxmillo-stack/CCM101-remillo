# Mission Reflection

**1. Why is object storage better suited for storing millions of photos compared to a tradition block storage hard drive?**
  - Block storage acts like a raw drive attached to one  server, split into fixed-size blocks with the OS managing the filesystem good for speed, but limited by the size of that one volume. Object storage instead stores each photo as an independent object (file + metadata + unique ID) in a flat  structure, accessed via HTTO-based APIs like S3. This lets storage scale almost infinitely, each photo is reachable by its own URL, and it's cheaper per GB for huge volume of unstructured files.
    
**2. How did using Docker make it easier to deploy the MinIO storage server?**
  - Docker let me launch MinIO with a single docker run command instead of manually installing and configuring a server. I could set root credentials as environment variables and map the API/console ports (9000,9001) in seconds. When the official minio/minio image was discontinued, I simply swapped in the frozen quay.io/minio/minio image without redoing the whole setup showing how portable Docker deployments are.
    
**3. What is a "bucket" in the content of cloud storage"**
  - A bucket is the top-level container that holds objects in object storage. I created one called client-photos, which acts like a root "folder" for the uploaded photos, even though object storage itself has no real folder hierarchy underneath.
    
**4. How do you think large enterprise companies ensure their object storage data is not lost if the physical server crashes?**
  - They likely replicate data across multiple servers, drives, and even different data centers or regions, plus use erasure coding and automated backups, so no single hardware failure results in permanent data loss.
    
**5. How is your confidence in navigating the Linux command line growing?**
  - It's improving steadily running docker commands, setting environment variables, and managing containers through the terminal feels more natural with each checkpoint.   
