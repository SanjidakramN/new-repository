# Stage 1: Build the Java application using Maven with JDK 17
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

# Copy the Maven configuration and source code
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean install

# Stage 2: Create the final Docker image with the built JAR file using Eclipse Temurin JDK 17
FROM eclipse-temurin:17-jre-focal
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Run the JAR file
CMD ["java", "-jar", "app.jar"]
