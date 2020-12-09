pipeline {
    agent {
        kubernetes {
            podRetention always()
            yaml """
                kind: Pod
                metadata:
                  name: jenkins-agent
                spec:
                  containers:
                  - name: maven
                    image: maven:3.6.3-openjdk-8-slim
                    imagePullPolicy: IfNotPresent
                    command:
                    - cat
                    tty: true
                  restartPolicy: Never
                """
        }
    }
    agent {
        kubernetes {
            containers containerTemplate {
                name 'maven'
                image 'maven:3.6.3-openjdk-8-slim'
                command 'cat'
                ttyEnabled true
            }
        }
    }
    stages {
        stage('Build maven project') {

            steps {
                container("maven") {
                    sh 'mvn -Dmaven.test.skip=true package'
                    archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                }
            }
        }
    }
}
