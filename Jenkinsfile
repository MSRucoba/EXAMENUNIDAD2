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
                // Token insertado correctamente
                sh './mvnw sonar:sonar -Dsonar.host.url=http://192.168.176.1:9000 -Dsonar.token=sqa_9f93c7d226dade3505055b69bcc45231fac60ce9'
            }
        }
    }
}