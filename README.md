# Minecraft Docker Server

## Table of Contents
- [Description](#description)
- [Quickstart](#quickstart)
- [Usage](#usage)
- [Files](#files)

---

## Description

This repository contains a minimal setup to run a Minecraft server inside a Docker container without relying on prebuilt Minecraft images.

It includes:
- A custom Dockerfile to build the Minecraft server image
- A docker-compose configuration for easy deployment
- Persistent storage configuration to retain world data
- Environment-based configuration for flexible server setup

The goal is to provide a reproducible and configurable Minecraft server environment.

---

## Quickstart

### Requirements
- Docker
- Docker Compose

### Start server

```bash
git clone https://github.com/<YOUR-GITHUB-USERNAME>/minecraft-server.git
cd minecraft-server
docker compose build --no-cache
docker compose up -d
```

The server will be available at:

```
<your-server-ip>:25565
```

---

## Usage

### Configuration

The server can be configured via environment variables in `docker-compose.yaml`:

| Variable | Description | Default |
|----------|------------|--------|
| MEMORY   | Max RAM allocation | 2G |
| JVM_OPTS | Additional JVM flags | "-Xmx2G -Xms2G" |

### Changing Minecraft Version

Replace the JAR file in the repository and rebuild:

```bash
docker compose build
```

### Data Persistence

World data is stored in the `mc-data` volume. This ensures:
- No data loss when restarting containers
- Easy backups

### Logs

```bash
docker logs -f mc-server
```

### Stop Server

```bash
docker compose down
```

---

## Files

### Dockerfile
Builds a custom Java runtime environment and runs the Minecraft server.

### docker-compose.yaml
Defines the Minecraft service, ports, volumes, and environment variables.

### .gitignore
Ensures unnecessary files (logs, world data, etc.) are not committed.

---

## Notes

- The EULA is automatically accepted via environment variable
- Default values ensure the container starts without additional configuration
- No authentication or sensitive data is stored in environment variables

---

## License

MIT

