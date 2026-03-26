# Persistente Daten liegen in /data
mkdir -p /data

# Server Properties erzeugen, falls sie fehlen
if [ ! -f /data/server.properties ]; then
  echo "Creating default server.properties..."
  cat > /data/server.properties <<EOL
# Minecraft server properties
server-port=25565
motd=My Docker Minecraft Server
EOL
fi

# EULA akzeptieren
if [ ! -f /data/eula.txt ]; then
  echo "eula=true" > /data/eula.txt
fi

# Wechsle ins Datenverzeichnis
cd /data

# Starte den Server
java $JVM_OPTS -Xmx${MEMORY} -Xms${MEMORY} -jar /app/server.jar --nogui