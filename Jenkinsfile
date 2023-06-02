pipeline {
    agent {
        label 'java-build-node'
    }
    stages {
        stage('BuildMavenJar') {
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
        stage('Deliver-executeJava') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}
