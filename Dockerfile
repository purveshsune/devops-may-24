#React frontend
FROM node:18 AS frontend-builder
WORKDIR /app
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

#Java backend
FROM maven:3.8.7-eclipse-temurin-17 AS backend-builder
WORKDIR /app
COPY backend/pom.xml .
COPY backend/src ./src
RUN mvn clean package -DskipTests

#Final image
FROM eclipse-temurin:17-jdk
WORKDIR /app

#Copying backend JAR
COPY --from=backend-builder /app/target/*.jar app.jar

#Copying frontend build to a static folder
COPY --from=frontend-builder /app/build /app/static
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
