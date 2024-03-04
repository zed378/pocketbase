# Pocketbase

This is base image for Pocketbase

## Usage

### Build Image

- Using Powershell

```bash
docker build --no-cache -t zed378/pocketbase:latest --build-arg PB_VERSION=$((Invoke-WebRequest -Uri "https://api.github.com/repos/pocketbase/pocketbase/releases/latest" | ConvertFrom-Json).tag_name.Substring(1)) .
```

- Using linux CLI

```bash
docker build --no-cache -t zed378/pocketbase:latest --build-arg PB_VERSION=$(wget -qO- https://api.github.com/repos/pocketbase/pocketbase/releases/latest | grep -o '"tag_name": "v.*"' | cut -d'"' -f4 | sed 's/^v//') .
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
