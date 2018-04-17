

pipeline {
    agent {
        docker { image 'node:9.11' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}
