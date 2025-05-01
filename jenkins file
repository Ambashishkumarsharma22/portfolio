pipeline {
    agent any

    environment {
        IMAGE_NAME = 'portfolio-site'
        CONTAINER_NAME = 'portfolio-container'
        PORT = '8080'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning repository..."
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Existing Container') {
            steps {
                echo "Stopping old container (if exists)..."
                sh """
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                """
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker container on port $PORT..."
                sh "docker run -d -p $PORT:80 --name $CONTAINER_NAME $IMAGE_NAME"
            }
        }
    }

    post {
        success {
            echo "✅ Deployment complete: http://localhost:$PORT"
        }
        failure {
            echo "❌ Deployment failed."
        }
    }
}
