pipeline {
    agent any
    environment {
        // Set AWS credentials using AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    tools {
        // Ensure Git is configured in Jenkins tools
        git 'Default'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://your-repo-url.git'
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
