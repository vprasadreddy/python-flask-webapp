#!groovy
pipeline {
    agent any
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
                git branch: 'main', credentialsId: 'github-creds', url: 'https://github.com/vprasadreddy/python-flask-webapp.git'
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
                    def zipFileName = 'workspace-archive.zip'
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
                    sh "zip -r ${zipFileName} ./code"
                    // Print the contents of the current directory to verify the zip
                    sh "zipinfo ${zipFileName}"
                }
                    }
                }
                stage('Login to Azure') {
                    steps {
                        // script {
                        // withCredentials([azureServicePrincipal('jenkins-pipeline-sp')]) {
                        // sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
                        // sh 'az acount show'
                        // }
                        // }
                        sh 'curl -sL https://aka.ms/InstallAzureCLIDeb | bash'
                        azureCLI commands: [[exportVariablesString: '', script: 'az account show']], principalCredentialId: 'jenkins-pipeline-sp'
                    }
                }
    }
}
