#!/bin/sh

# Exit immediately if a command fails or an undefined variable is used
set -eu

# Default values (can be overridden via environment variables)
: "${MEMORY:=2G}"
: "${JVM_OPTS:=-Xmx2G -Xms2G}"
: "${SERVER_PORT:=25565}"
: "${MOTD:=My Docker Minecraft Server}"

# Ensure data directory exists
mkdir -p /data

# Create server.properties if it does not exist
if [ ! -f /data/server.properties ]; then
  echo "Creating default server.properties..."
  cat > /data/server.properties <<EOL
# Minecraft server properties
server-port=${SERVER_PORT}
motd=${MOTD}
EOL
fi

# Accept EULA if not already accepted
if [ ! -f /data/eula.txt ]; then
  echo "eula=true" > /data/eula.txt
fi

# Change to data directory
cd /data

# Start the Minecraft server
exec java ${JVM_OPTS} -Xmx${MEMORY} -Xms${MEMORY} -jar /app/server.jar --nogui