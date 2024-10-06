#!groovy
pipeline {
    agent any
    stages {
        stage('Checkout Git Branch') {
                agent {
                docker {
                    image 'python:2-alpine'
                }
                }
            steps {
                sh 'python - m pip install - upgrade pip'
                sh 'pip install -r requirements.txt'
            }
        }
    }
}
