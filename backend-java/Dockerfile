FROM maven:3.9.6-eclipse-temurin-17-alpine AS builder

WORKDIR /app

# Copia o pom.xml
COPY pom.xml .

# Baixa as dependências
RUN mvn dependency:go-offline

# Copia o código-fonte
COPY src ./src

# Compila e cria o JAR
RUN mvn clean package -DskipTests

# ========== Stage 2: Runtime ==========
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copia o JAR da stage anterior
COPY --from=builder /app/target/ilena-backend-0.2.0.jar app.jar

EXPOSE 8000

ENTRYPOINT ["java", "-jar", "app.jar"]

