pipeline {
  agent any

  environment {
    AWS_REGION = 'us-east-1'
    // These are Jenkins credentials (type: AWS Credentials)
    AWS_ACCESS_KEY_ID = credentials('aws-creds-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-creds-id')
  }

  stages {
    stage('Clone GitHub Repo') {
      steps {
        git branch: 'main', url: 'https://github.com/pratheesh-dev-tech/tf.git'
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
        sh 'terraform apply -auto-approve'
      }
    }
  }

  post {
    success {
      echo 'Terraform apply completed successfully.'
    }
    failure {
      echo 'Terraform apply failed.'
    }
  }
}
