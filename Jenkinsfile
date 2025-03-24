pipeline {
    agent any

    stages {
        stage('fetchthesourcecode'){
            steps {
                git branch: 'master', credentialsId: 'git_hub', url: 'git@github.com:jayantprojects/cicd.git'
            }
        } 
        stage('Build Docker Image') {
            steps {
                script {
                        // Authenticate with Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        // Build and tag the image
                        def appImage = docker.build('jayantborate14/cicdlab:$BUILD_NUMBER')

                        // Push the image to Docker Hub
                        appImage.push()
                    }
                }
            }
        }
    }
}
