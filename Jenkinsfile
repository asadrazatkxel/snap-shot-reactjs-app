pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'dev', url: 'https://github.com/asadrazatkxel/snap-shot-reactjs-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh '''
                    echo "Building Docker image..."
                    docker build -t my-react-static-app -f ./custom-dockerfile .
                    '''
                }
            }
        }

        stage('Code Analysis') {
            environment {
                scannerHome = tool name: 'sonar'
            }    
            steps {
                withSonarQubeEnv('sonar') {
                    sh """
                        ${scannerHome}/bin/sonar-scanner \
                            -Dsonar.projectKey=sonar-project \
                            -Dsonar.projectName=sonar-key \
                            -Dsonar.sources=.
                    """
                }
            }
        }
    }
}
