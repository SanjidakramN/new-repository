pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                sh'''
                kubectl apply -f service.yaml
                '''
            }
        }
    }
}
