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
    }
    post {
        success {
            setBuildStatus("Build succeeded", "SUCCESS");
        }
        failure {
            setBuildStatus("Build failed", "FAILURE");
        }
    }
}