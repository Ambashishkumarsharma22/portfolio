pipeline {
    agent any

    environment {
        IMAGE_NAME = 'portfolio-site'
        CONTAINER_NAME = 'portfolio-site'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Existing Container') {
            steps {
                echo 'Stopping and removing existing container if any...'
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running new Docker container...'
                sh 'docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment succeeded.'
        }
        failure {
            echo '❌ Deployment failed.'
        }
    }
}
