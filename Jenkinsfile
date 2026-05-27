pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'chmod +x mvnw'
                sh './mvnw clean package'
            }
        }
        stage('Test') {
            steps {
                sh './mvnw test'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                sh './mvnw sonar:sonar -Dsonar.host.url=http://192.168.176.1:9000 -Dsonar.token=sqa_9f93c7d226dade3505055b69bcc45231fac60ce9'
            }
        }
        stage('Deploy') {
            steps {
                // 1. Borramos el contenedor viejo si existe
                sh 'docker rm -f api-orders || true'
                // 2. Construimos la imagen localmente
                sh 'docker build -t api-orders-image .'
                // 3. Lanzamos el contenedor usando el puerto 8082 (host) -> 8080 (contenedor)
                sh 'docker run -d --name api-orders -p 8082:8080 api-orders-image'
            }
        }
    }
}
