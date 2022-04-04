pipeline {
    agent any
    stages {
        stage('Build') { 
            agent {
                docker {
                    image 'node:lts-bullseye-slim' 
                    args '-p 3000:3000'
                    reuseNode true
                }
            }
            steps {
                sh 'npm install' 
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
        stage('Docker image'){
            steps {
                echo 'Starting to build docker image'

                script {
                    def customImage = docker.build("app:1.0")
                }
            }
        }
    }
}