#!groovy
pipeline {
    agent any
    stages {
        stage('Checkout Git Branch') {
            steps {
                sh 'python3 -m pip install --upgrade pip'
                sh 'pip install -r requirements.txt'
            }
        }
    }
}
