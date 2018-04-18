

pipeline {
    agent {   
            node { label 'docker' } 
      }
     options {
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '14'))
        timestamps()
    }
    environment {
        AWS_ACCESS_KEY = credentials('MEM_AWS_ACCESS_KEY')
        AWS_SECRET_KEY = credentials('MEM_AWS_SECRET_KEY')
    }
    parameters { 
       string(name: 'ECR_REPO', defaultValue: 'api', description: 'Please enter the ecr repo name')
       string(name: 'ECR_URL', defaultValue: '285965978269.dkr.ecr.eu-west-1.amazonaws.com', description: 'Please enter the ecr url')
       
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
