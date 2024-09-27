pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_IMAGE = 'myproject-image'
        SONARQUBE_SERVER = 'SonarQube'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Check out the code from the GitHub repository using credentials
                git branch: 'main',
                    credentialsId: 'your-jenkins-credentials-id', // Add Jenkins credentials ID here
                    url: 'https://github.com/asadrazatkxel/snap-shot-reactjs-app.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    // Run SonarQube analysis on the code
                    withSonarQubeEnv('SonarQube') {
                        sh 'mvn clean verify sonar:sonar'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image from the Dockerfile
                    sh '''
                    docker build -t ${DOCKER_IMAGE} .
                    '''
                }
            }
        }
    }

    post {
        always {
            // Clean up resources or perform actions after the pipeline
            echo "Pipeline completed!"
        }
    }
}
