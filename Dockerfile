# Use lightweight Java 17 image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Build the JAR (skip tests to speed up)
RUN ./mvnw clean package -DskipTests

# Expose Eureka default port
EXPOSE 8761

# Run the built JAR
ENTRYPOINT ["java", "-jar", "target/eureka-server-0.0.1-SNAPSHOT.jar"]
