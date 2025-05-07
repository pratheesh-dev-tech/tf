pipeline {
    agent any

    environment {
        // Set Terraform path explicitly
        PATH = "/opt/homebrew/bin:${env.PATH}"
    }

    stages {
        stage('Clone GitHub Repo') {
            steps {
                git 'https://github.com/pratheesh-dev-tech/tf.git'
            }
        }

        stage('Set AWS Credentials') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                    credentialsId: 'aws-creds-id'  // Use your AWS credentials ID here
                ]]) {
                    // AWS credentials are now available as environment variables
                    echo 'AWS Credentials are set.'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Approve Terraform Apply?'
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        failure {
            echo 'Terraform apply failed.'
        }
    }
}
