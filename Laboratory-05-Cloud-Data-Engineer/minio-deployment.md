
# MinIO Deployment

## Docker Command Used

Note: The original `minio/minio` image on Docker Hub was discontinued by MinIO 
in late 2025, so this deployment uses the frozen `quay.io` copy instead.

docker run -d -p 9000:9000 -p 9001:9001 --name minio-server \
-e "MINIO_ROOT_USER=cloudadmin" \
-e "MINIO_ROOT_PASSWORD=CloudNova2026!" \
quay.io/minio/minio:RELEASE.2025-09-07T16-13-09Z server /data --console-address ":9001"

## Console Access

The MinIO web console was accessed on port **9001**.

## Bucket Created

**client-photos**

## Environment Variables Explained

- `MINIO_ROOT_USER` — sets the admin username used to log into the MinIO 
  console and API.
- `MINIO_ROOT_PASSWORD` — sets the admin password paired with that username.

These two environment variables configure the initial root credentials for 
the MinIO server at container startup, since MinIO needs an authenticated 
admin account before any buckets or users can be managed.
