#!groovy
pipeline {
    agent any
    stages {
        stage('Checkout Git Branch') {
            steps {
                sh 'python - m pip install - upgrade pip'
                sh 'pip install -r requirements.txt'
            }
        }
    }
}
