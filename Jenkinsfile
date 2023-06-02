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
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
        stage('Pipeline status') {
            steps {
                script{
                    info(message:"Pipeline executed successfully")
                }
            }
        }
    }
}
