pipeline {
    agent {
        kubernetes {
            yaml """
                spec
                  containers:
                  - name: maven
                    image: maven:3.6.3-openjdk-8-slim
                    command:
                    - cat
                    tty: true
                  - name: maven2
                    image: maven:3.6.3-openjdk-8-slim
                    command:
                    - cat
                    tty: true
                """
        }
    }

    stages {
        stage('Build maven project') {
            steps {
                container("maven") {
                    withMaven {
                        sh 'mvn -Dmaven.test.skip=true package'
                    }
                }
            }
        }
    }
}
