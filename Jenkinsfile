pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'    
        AWS_ACCOUNT_ID = '123456789012' 
        ECR_REPO = 'your-ecr-repo-name'   
        DOCKERHUB_IMAGE = '////////'   
        IMAGE_TAG = 'latest'
    }
    stages {
        stage('Pull Image from Docker Hub') {
            steps {
                script {
                    echo "Pulling Docker Hub image: ////////"
                    sh "docker pull ////////"
                }
            }
        }
        stage('Tag Image for ECR') {
            steps {
                script {
                    def ecrImage = "////////"
                    sh "docker tag ////////"
                }
            }
        }
        stage('Login to ECR') {
            steps {
                script {
                    echo "Logging into ECR..."
                    sh '''
                        aws ecr get-login-password --region //////// | \
                        docker login --username AWS --password-stdin ////////
                    '''
                }
            }
        }
        stage('Push to ECR') {
            steps {
                script {
                    def ecrImage = 
                    echo "Pushing image to ECR"
                    sh "docker push"
                }
            }
        }
    }
}
