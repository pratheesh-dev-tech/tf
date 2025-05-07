pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-creds-id')  // Use the credentials ID for AWS Access Key
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds-id')  // Use the credentials ID for AWS Secret Access Key
        AWS_DEFAULT_REGION = 'us-west-2'  // Set your AWS region
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Set AWS Credentials') {
            steps {
                echo 'AWS Credentials are set.'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh '/opt/homebrew/bin/terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                script {
                    sh '/opt/homebrew/bin/terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh '/opt/homebrew/bin/terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh '/opt/homebrew/bin/terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
