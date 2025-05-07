pipeline {
  agent any

  environment {
    AWS_REGION = 'us-east-1'
    AWS_CREDENTIALS = credentials('your-aws-creds-id') // Replace with Jenkins credential ID
  }

  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/your-username/your-terraform-repo.git'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
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
}
