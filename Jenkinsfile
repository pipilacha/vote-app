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
            }
        }
        stage('docker-package-dev') {
            when {
                branch '^feature|^bugfix'
            }
            agent any
            steps {
                echo 'Packaging vote app with docker'
                script {
                    docker.withRegistry('https://index.docker.io/v1/','docker-login') {
                        def workerImage = docker.build ("${env.GIT_URL.tokenize('/.')[-3]}/vote-app:${env.BRANCH_NAME}-${env.BUILD_ID}", './vote')
                        workerImage.push()
                        workerImage.push('latest')
                    }
                }
            }
        }
    }
}