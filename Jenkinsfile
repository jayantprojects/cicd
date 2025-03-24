// in this project we have used ssh key for auth with git you can use pat as per the requirement 
// for successfull execution on the server of jenkins git and docker should be installed 
// sudo usermod -aG docker jenkins 
// after firing this command jenkins should be restarted 
pipeline {
    agent any

    stages {
        stage('fetchthesourcecode') {
            steps {
                git credentialsId: 'git_hub', url: 'git@github.com:jayantprojects/cicd.git', branch: 'master'
            }
        }
        // stage one finish 
        stage('Build Docker Image and push to Docker Hub') {
            steps {
                script {
                    def imageTag = "${env.BUILD_NUMBER}".replaceAll(/[^a-zA-Z0-9_.-]/, '_') // Ensure tag is valid
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        def appImage = docker.build("jayantborate14/cicdlab:${imageTag}")
                        appImage.push()
                       // appImage.push('latest') // Push the latest tag as well
                    }
                }
            }
        }
        // stage two finish 
    }
}
