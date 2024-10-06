#!groovy
pipeline {
    agent any
    stages {
        stage('Checkout Git Branch') {
            steps {
                sh 'python3 -m pip install --upgrade pip'
                sh 'pip3 install -r requirements.txt'
            }
        }
    }
}
