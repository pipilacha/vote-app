pipeline {
    agent none
    stages{
        stage('running unit tests'){
            agent {
                docker {
                    image 'python:2.7-alpine'
                    args '-u root --privileged'
                }
            }
            steps{
                echo 'Building vote app'
                sh 'pip install -r requirements.txt'
                sh 'nosetests tests/'
                echo env.CHANGE_BRANCH
                echo env.CHANGE_TARGET
            }
        }
        stage('docker-package-dev') {
            when {
                environment name: 'CHANGE_TARGET', value: 'develop'
            }
            agent any
            steps {
                echo 'Packaging vote app with docker'
                script {
                    docker.withRegistry('https://index.docker.io/v1/','docker-login') {
                        def workerImage = docker.build ("${env.GIT_URL.tokenize('/.')[-3]}/vote-app:${env.CHANGE_BRANCH}-${env.BUILD_ID}", '.')
                        workerImage.push()
                        workerImage.push('latest')
                    }
                }
            }
        }
    }
}