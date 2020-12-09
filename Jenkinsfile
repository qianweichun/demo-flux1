pipeline {
    agent {
        kubernetes {
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
    stages {
        stage('Build maven project') {
            agent {
                kubernetes {
                    yaml """
kind: Pod
metadata:
  label: agents-stage1
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
            steps {
                container("maven") {
                    sh 'mvn -Dmaven.test.skip=true package'
                }
            }
        }
        stage("") {
            steps {

            }
        }
    }
}
