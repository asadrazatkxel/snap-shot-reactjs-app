pipeline {
    agent any

    environment {
        SONARQUBE_SERVER = 'sonar'
        SONARQUBE_SCANNER = 'sonar-scanner'
        DOCKER_IMAGE = 'your-dockerhub-username/your-app-name'
        DOCKER_CREDENTIALS_ID = 'your-docker-credentials-id'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'dev', url: 'git@github.com:asadrazatkxel/snap-shot-reactjs-app.git'
            }
        }

        stage('SonarQube Scan') {
            steps {
                withSonarQubeEnv(SONARQUBE_SERVER) {
                    sh "${SONARQUBE_SCANNER} -Dsonar.projectKey=sonar-key -Dsonar.sources=./src -Dsonar.javascript.lcov.reportPaths=coverage/lcov.info"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE}:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    sh 'docker push ${DOCKER_IMAGE}:latest'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
