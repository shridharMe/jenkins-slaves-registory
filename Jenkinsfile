

pipeline {
    agent {   
            node { label 'docker' } 
      }
     options {
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '14'))
        timestamps()
    }
    environment {
    }
    parameters { 
    }
    stages {
        stage('BUILD') {
              parallel {
            stage('API_BUILD') {
            steps {
                 sh  '''
                    node --version
                '''
            }
             }
           stage('WEBAPP_BUILD') {
            steps {
                 sh  '''
                    node --version
                '''
            }
             }
           }
        }
    }
}
