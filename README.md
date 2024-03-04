# Pocketbase

This is base image for Pocketbase

## Usage

### Build Image

```bash
docker build -t pocketbase:latest .
```

### Deploy

- Using docker compose

```bash
docker-compose up -d
```

- Using docker cli

```bash
docker run -d \
  --name=pocketbase \
  -p 8090:8090 \
  -e ENCRYPTION=example `#optional` \
  -v /path/to/data:/pb_data \
  -v /path/to/public:/pb_public `#optional` \
  -v /path/to/hooks:/pb_hooks `#optional` \
  --restart unless-stopped \
  ghcr.io/muchobien/pocketbase:latest \
  --encryptionEnv ENCRYPTION `#optional`
```

### Access

```bash
http://localhost:8090/_/
```
