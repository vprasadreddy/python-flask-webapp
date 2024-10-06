#!groovy
pipeline {
    agent any
    stages {
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
    }
}
