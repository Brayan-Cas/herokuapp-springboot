FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

EXPOSE 10000

CMD ["sh", "-c", "java -jar target/herokuapp-0.0.1-SNAPSHOT.jar --server.port=${PORT:-10000}"]
