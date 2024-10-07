#!groovy

pipeline {
  agent any
  environment {
    AZURE_RESOURCE_GROUP = 'python-webapp-rg'
    WEBAPP_NAME = "python-webapp"
    PACKAGE_NAME = "python-app-package.zip"
  }
  stages {
    stage('Workspace Cleanup') {
      steps {
        // Clean before build
        cleanWs()
        echo 'cleaning workspace...'
      }
    }
    stage('Checkout Git Branch') {
      steps {
        git branch: 'main', credentialsId: 'github-credentials', url: 'https://github.com/vprasadreddy/python-flask-webapp.git'
      }
    }
    stage('Build Application') {
      steps {
        sh 'python3 -m pip install --upgrade pip'
        sh 'pip3 install -r requirements.txt'
      }
    }
    stage('Package Application') {
      steps {
        script {
          // Define the name of the zip file
          // def zipFileName = 'python-app-package.zip'
          // Zip the entire workspace directory
          // sh """
          //     zip -r ${zipFileName} . \
          //     -x '.github/*' \
          //     -x '.gitignore' \
          //     -x 'node_modules/*' \
          //     -x '.git/*' \
          //     -x '.dockerignore' \
          //     -x 'Jenkinsfile' \
          //     -x '*.md'
          //     """
          sh "cd code && zip -r ../${PACKAGE_NAME} ./*"
          // Print the contents of the current directory to verify the zip
          sh "zipinfo ${PACKAGE_NAME}"
        }
      }
    }
    stage('Login to Azure') {
      steps {
        script {
          withCredentials([azureServicePrincipal('jenkins-pipeline-sp')]) {
            sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
            // sh 'az account show'
            sh 'az webapp deploy --resource-group ${AZURE_RESOURCE_GROUP} --name ${WEBAPP_NAME} --src-path "${WORKSPACE}/${PACKAGE_NAME}"'
          }
        }
        // azureCLI commands: [[exportVariablesString: '', script: 'az account show']], principalCredentialId: 'jenkins-pipeline-sp'
      }
    }
  }
}