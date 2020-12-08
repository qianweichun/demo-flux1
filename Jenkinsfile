pipeline {
    agent {
        kubernetes {
            containers [containerTemplate(name: 'maven', image: 'maven:3.6.3-openjdk-8-slim', ttyEnabled: true, command: 'cat')]
        }
    }
    stages {
        stage('Build maven project') {
            steps {
                container("maven") {
                    sh 'mvn -Dmaven.test.skip=true package'
                }
            }
        }
    }
}
