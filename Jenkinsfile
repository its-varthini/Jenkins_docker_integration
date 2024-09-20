pipeline {
    
    agent any 
    
    environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
    }
    
    stages {
        
        stage('Checkout'){
           steps {
                git url: 'https://github.com/its-varthini/warfile_to_dockerimage.git',
                branch: 'main'
           }
        }

        stage('Build Docker'){
            steps{
                script{
                    sh '''
                    echo 'Buid Docker Image'
                    docker build -t varthinidochub/cicd-e2e:${BUILD_NUMBER} .
                    '''
                }
            }
        }

        stage('Push the artifacts'){
           steps{
                script{
                    sh '''
                    echo 'Push to Repo1'
                     withDockerRegistry(credentialsId: 'docker_cred', url: 'https://hub.docker.com/')
                    docker push varthinidochub/cicd-e2e:${BUILD_NUMBER}
                    '''
                }
            }
        }
        
        
        
      }
}
