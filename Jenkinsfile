pipeline {
    agent any

    environment {
        CNT_NAME = 'portfolio'
        IMG = 'portfolio'
        EMAIL = 'hassanmazhar682@gmail.com'
        PORT = '80'
    }

    stages {

        stage("A") {
            steps {
                echo "We are building a Jenkins pipeline"
            }
            post {
                failure {
                    echo "======== Stage A execution failed ========"
                }
            }
        }

        stage("Clone repo") {
            steps {
                echo "Cloning GitHub repository..."
                git branch: 'main', url: 'https://github.com/HSNMZHR734/jenkinssimpleproject.git'
            }
            post {
                failure {
                    echo "======== Clone repo failed ========"
                }
            }
        }

        stage('Build Docker image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t $IMG .'
            }
            post {
                failure {
                    echo "======== Docker build failed ========"
                }
            }
        }

        stage('Stop and Remove Old Container') {
            steps {
                echo "Stopping old container (if running)..."
                sh '''
                    docker stop $CNT_NAME || true
                    docker rm $CNT_NAME || true
                '''
            }
        }

        stage('Run Docker container') {
            steps {
                echo "Running new container..."
                sh '''
                    docker run -d -p ${PORT}:80 --name $CNT_NAME $IMG
                '''
            }
            post {
                success {
                    echo "Container is running successfully on port ${PORT}"
                }
                failure {
                    echo "======== Container run failed ========"
                }
            }
        }

        stage('Send Email') {
            steps {
                echo "Sending email notification..."
                emailext(
                    subject: "App deployed successfully",
                    body: "Your app has been deployed successfully!\n\nVisit: http://18.221.65.248:${PORT}/",
                    to: "${EMAIL}"
                )
            }
        }
    }
}
