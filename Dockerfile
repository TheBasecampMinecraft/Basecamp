FROM openjdk:17-jdk-slim
WORKDIR /app
COPY . .
RUN echo "eula=true" > eula.txt
EXPOSE 25565
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
