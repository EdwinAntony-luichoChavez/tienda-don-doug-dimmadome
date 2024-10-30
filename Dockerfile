# Etapa de construcción
FROM maven:3.9.7-eclipse-temurin-21-alpine AS build

WORKDIR /app

# Copia los archivos de configuración
COPY pom.xml ./
COPY src ./src

# Copia el archivo .env
COPY .env ./

# Construye la aplicación
RUN mvn clean package -DskipTests

# Etapa de ejecución
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Variable para el archivo JAR
ARG JAR_FILE=target/tienda-don-doug-dimmadome-0.0.1-SNAPSHOT.jar

# Copia el JAR construido en la etapa anterior
COPY --from=build /app/${JAR_FILE} app.jar

# Copia el archivo .env también en esta etapa (opcional si ya se copió antes)
COPY --from=build /app/.env ./

# Expone el puerto de la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["java", "-jar", "app.jar"]
