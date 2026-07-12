# Étape 1 : Build avec Maven
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
# Télécharger les dépendances d'abord (cache Docker)
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests

# Étape 2 : Image finale légère
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
# Copier uniquement le JAR compilé
COPY --from=build /app/target/projet-club_escalade-0.0.1-SNAPSHOT.jar app.jar
# Exposer le port
EXPOSE 8080
# Démarrer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]
