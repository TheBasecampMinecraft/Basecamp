FROM openjdk:17-jdk-slim
WORKDIR /app
RUN apt-get update && apt-get install -y curl

RUN rm -f server.jar \
    && curl -o server.jar https://launcher.mojang.com/v1/objects/<hash>/server.jar

RUN echo "eula=true" > eula.txt
EXPOSE 25565
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
