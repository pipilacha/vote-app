pipeline {
    agent none
    stages{
        stage('get all envs'){
            agent any
            steps{
                sh 'printenv'
            }
        }
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
                environment name: 'CHANGE_TARGET', value: 'develop'
            }
            agent any
            steps {
                echo 'Packaging vote app with docker'
                script {
                    docker.withRegistry('https://index.docker.io/v1/','docker-login') {
                        def workerImage = docker.build ("${env.GIT_URL.tokenize('/.')[-3]}/vote-app:${env.CHANGE_BRANCH.tokenize('/')[-1]}-${env.BUILD_ID}", '.')
                        workerImage.push()
                        // workerImage.push('latest') we don't wan't to push dev version as latest
                    }
                }
            }
        }
        stage('docker-package-main') {
            when {
                environment name: 'CHANGE_TARGET', value: 'main'
            }
            agent any
            steps {
                echo 'Packaging vote app with docker'
                script {
                    docker.withRegistry('https://index.docker.io/v1/','docker-login') {
                        def workerImage = docker.build ("${env.GIT_URL.tokenize('/.')[-3]}/vote-app:${env.CHANGE_BRANCH.tokenize('/')[-1]}-${env.BUILD_ID}", '.')
                        workerImage.push()
                        workerImage.push('latest')
                    }
                }
            }
        }
    }
}