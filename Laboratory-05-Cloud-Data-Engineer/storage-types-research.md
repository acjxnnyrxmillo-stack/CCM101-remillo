# Types of Cloud Storage

|Storage Type | Description | Primary Use Case |  Cloud Provider Example |
|-------------|-------------|-------------------|-------------------------|
|**Block Storage** | Data gets split into fixed-size blocks, each with its own address, and the operating system handles the filesystem on top of that. It woks basically like a raw hard drive attached directly to one server. | Workloads that need speed and low latency, like databases or the boot volume for a VM | AWS EBS |
|**File Storage** | Data is organized in folders and files, accessed over a network using protocols like NFS or SMB, and multiple machines can mount and share the same drive. | Shared file systems, content management, home directories accessed  by several servers at once | AWS EFS|
|**Object Storage** | Data is stored as individual objects the file itself, its metadata, and a unique ID in a flat structure with no folder hierarchy, accessed through HTTP-based APIs like S3 | Huge volumes of unstructured data: images, videos, backups, static site files | AWS S3 |

## Why Object Storage fits the client's needs

Since the client is dealing with millions of user-uploaded photos, they need something that can grow without limits and without the constraints of fixed-size volumes the way block storage works. Object storage stores each photo as its own object, reachable directly through a URL or API call, which also tends to be cheaper per GB when you're storing huge numbers of individual files rather than one big continuous volume.
