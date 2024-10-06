#!groovy
pipeline {
    agent any
    stages {
        // stage('Checkout Git Branch') {
        //     steps {
        //         git branch: 'main', credentialsId: 'github-creds', url: 'https://github.com/vprasadreddy/python-flask-webapp.git'
        //     }
        // }
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
                    sh "zip -r ${zipFileName} ."
                    // Print the contents of the current directory to verify the zip
                    sh "ls -lh ${zipFileName}"
                    sh 'zipinfo workspace-archive'
                }
                    }
                }
    }
}
