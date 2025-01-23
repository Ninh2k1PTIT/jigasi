## Step 1: Build the application with Maven
#FROM maven:3.9.9-eclipse-temurin-23 AS build
#
## Set working directory for the app
#WORKDIR /app
#
## Copy only the pom.xml first to leverage Docker cache for Maven dependencies
#COPY pom.xml .
#
#
## Copy the source code into the container
#COPY src ./src
#
## Build the app and skip tests (you can enable tests if needed)
#RUN mvn clean package -DskipTests

# Step 2: Create the production image
FROM openjdk:11-jdk

# Set working directory for the production image
WORKDIR /app

# Copy the JAR file from the build container into the production image
COPY /target/jigasi-*.jar /app/jigasi.jar

# Expose necessary ports (you may need to add more depending on your config)
EXPOSE 8080 10000

# Command to run the application
ENTRYPOINT ["java", "-jar", "/app/jigasi.jar"]

# Optionally, you could also use CMD if you need more flexibility
# CMD ["java", "-jar", "/app/jigasi.jar"]
