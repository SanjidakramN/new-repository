pipeline {
    agent any

    stages {
        stage('build') {
            steps {
		withCredentials([usernamePassword(credentialsId: 'docker-cred' , usernameVariable: 'USERNAME' , passwordVariable: 'PASSWORD')]) {
                 sh'''
		 mvn clean install
                 docker build -t sanjidakram/java-image .
                 docker login -u $USERNAME -p $PASSWORD
                 docker push sanjidakram/java-image
                 '''
                }
            }
        }
        stage('run') {
            steps {
                sh'''
                kubectl apply -f deployment.yaml
                '''
            }
        }
    }
}

