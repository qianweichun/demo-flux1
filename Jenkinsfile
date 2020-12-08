pipeline {
    podTemplate(containers: [
            containerTemplate(name: 'maven', image: 'maven:3.6.3-openjdk-8-slim', ttyEnabled: true, command: 'cat')
    ]) {
        node(POD_LABEL) {
            stage('Build maven project') {
                container("maven") {
                    sh 'mvn -Dmaven.test.skip=true package'
                }
            }
        }
    }
}
