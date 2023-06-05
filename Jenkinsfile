@Library('shared-library-nandhini') _

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
                //sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                script{
                    test()
                }
                //sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
         stage('Package') {
            steps {
                script{
                    pack()
                }
                //sh 'mvn test'
            }
         }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
        
        stage('Checking src') {
            steps{
                mySharedLibrary()
            }
        }

    }
}
