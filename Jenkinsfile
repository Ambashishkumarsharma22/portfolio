pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t portfolio-site .'
            }
        }

        stage('Stop Existing Container') {
            steps {
                script {
                    sh 'docker stop portfolio-container || true'
                    sh 'docker rm portfolio-container || true'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 3001:3000 --name portfolio-container portfolio-site'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
    }
}
