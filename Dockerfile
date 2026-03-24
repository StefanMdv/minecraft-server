FROM eclipse-temurin:21-jre

WORKDIR /server

# Default environment variables
ENV MEMORY=2G
ENV JVM_OPTS=""

# Copy server jar
COPY server.jar server.jar

# Accept EULA automatically
RUN echo "eula=true" > eula.txt

EXPOSE 25565

CMD sh -c "java -Xms${MEMORY} -Xmx${MEMORY} $JVM_OPTS -jar server.jar nogui"