pipeline {
    agent any
    
    environment {
        // Set the path to Terraform binary
        TERRAFORM_PATH = "/opt/homebrew/bin/terraform"
    }
    
    stages {
        // Stage to checkout SCM (GitHub Repository)
        stage('Checkout SCM') {
            steps {
                checkout([$class: 'GitSCM', 
                    branches: [[name: '*/main']], // Checkout main branch
                    userRemoteConfigs: [[url: 'https://github.com/pratheesh-dev-tech/tf.git']]
                ])
            }
        }

        // Stage to set AWS credentials
        stage('Set AWS Credentials') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding', 
                    credentialsId: 'aws-creds-id', 
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    echo "AWS Credentials are set."
                }
            }
        }

        // Stage to initialize Terraform
        stage('Terraform Init') {
            steps {
                script {
                    sh """
                        export PATH=$PATH:$TERRAFORM_PATH
                        terraform init
                    """
                }
            }
        }

        // Stage to validate Terraform configuration
        stage('Terraform Validate') {
            steps {
                script {
                    sh """
                        terraform validate
                    """
                }
            }
        }

        // Stage to plan Terraform changes
        stage('Terraform Plan') {
            steps {
                script {
                    sh """
                        terraform plan
                    """
                }
            }
        }

        // Stage to apply Terraform configuration
        stage('Terraform Apply') {
            steps {
                script {
                    sh """
                        terraform apply -auto-approve
                    """
                }
            }
        }

        // Post Actions: To handle post pipeline actions like cleanup or notifications
        stage('Post Actions') {
            steps {
                echo "Terraform apply finished."
            }
        }
    }

    post {
        failure {
            echo "Pipeline failed. Please check the logs."
        }
    }
}
