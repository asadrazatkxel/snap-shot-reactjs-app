pipeline {
    agent any

    environment {
        // Replace these with your actual environment variables for SonarQube and DockerHub
        SONARQUBE_SERVER = 'sonar'
        SONARQUBE_SCANNER = 'sonar'
        DOCKER_IMAGE = 'your-dockerhub-username/your-app-name'
        DOCKER_CREDENTIALS_ID = 'your-docker-credentials-id'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Fetching code from Git...'
                // Replace with your Git repo URL
                git branch: 'dev', url: 'git@github.com:asadrazatkxel/snap-shot-reactjs-app.git'
            }
        }

        stage('SonarQube Scan') {
            steps {
                echo 'Running SonarQube scan...'
                script {
                    // Ensure SonarQube is installed and configured
                    withSonarQubeEnv(SONARQUBE_SERVER) {
                        sh """
                        ${SONARQUBE_SCANNER} \
                        -Dsonar.projectKey=sonar \
                        -Dsonar.projectName=sonar \
                        -Dsonar.sources=./src \
                        -Dsonar.language=js \
                        -Dsonar.sourceEncoding=UTF-8 \
                        -Dsonar.javascript.lcov.reportPaths=coverage/lcov.info
                        """
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    sh 'docker build -t ${DOCKER_IMAGE}:latest .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to DockerHub...'
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                        sh 'docker push ${DOCKER_IMAGE}:latest'
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
            cleanWs() // Clean workspace after build
        }
    }
}
