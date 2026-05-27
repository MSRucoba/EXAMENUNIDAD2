# Usamos una imagen base con Java 21
FROM eclipse-temurin:21-jdk-alpine
# Copiamos el archivo jar generado por Maven
COPY target/*.jar app.jar
# Exponemos el puerto 8080
EXPOSE 8080
# Comando para ejecutar la aplicación
ENTRYPOINT ["java","-jar","/app.jar"]