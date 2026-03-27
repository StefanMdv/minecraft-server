FROM eclipse-temurin:21-jre

WORKDIR /app

ENV MEMORY=2G
ENV JVM_OPTS=""

COPY server.jar /app/server.jar
COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

EXPOSE 25565

ENTRYPOINT ["sh", "/app/entrypoint.sh"]