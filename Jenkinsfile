pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = 'us-east-1'
  }

  stages {
    stage('Checkout SCM') {
      steps {
        git url: 'https://github.com/pratheesh-dev-tech/tf.git', branch: 'main'
      }
    }

    stage('Set AWS Credentials') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'aws-creds-id', // Replace this with your actual Jenkins credential ID
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
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
        input message: 'Approve apply?'
        sh 'terraform apply -auto-approve'
      }
    }
  }

  post {
    failure {
      echo 'Pipeline failed. Please check the logs.'
    }
  }
}
