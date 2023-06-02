@Library("shared-library-nandhini") _
pipeline {
    agent {
        label 'java-build-node'
    }
    stages {
        stage('Build') {
            steps {
                script{
                    build()
                }
            }
            
        }
        stage('Test') {
            steps {
                script{
                    test()
                }
            }
             post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver-executeJava') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}
