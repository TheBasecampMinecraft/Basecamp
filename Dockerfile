FROM openjdk:17-jdk-slim
WORKDIR /app
RUN apt-get update && apt-get install -y curl

RUN rm -f server.jar \
    && curl -o server.jar https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar

RUN echo "eula=true" > eula.txt
EXPOSE 25565
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
