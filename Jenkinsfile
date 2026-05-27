pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Damos permisos de ejecución al wrapper de Maven
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
                sh './mvnw sonar:sonar'
            }
        }
    }
}