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
                // Aquí usamos la IP que encontramos para tu WSL
                sh './mvnw sonar:sonar -Dsonar.host.url=http://192.168.176.1:9000'
            }
        }
    }
}