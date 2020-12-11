pipeline {
    agent {
        kubernetes imagePullSecrets:["default"], containerTemplates: [containerTemplate(name: 'maven', image: 'maven:3.6.3-openjdk-8-slim', command: 'cat', ttyEnabled: true),
                                                                      containerTemplate(name: 'maven2', image: 'maven:3.6.3-openjdk-8-slim', command: 'cat', ttyEnabled: true)]
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
