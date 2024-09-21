pipeline {
    
    agent any 
    
    environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
        DOCKERHUB_CREDENTIALS= credentials('docker_cred')
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
       
        stage('Login to Docker Hub') {      	
            steps{                       	
            	sh '''
            	docker login --username=$DOCKERHUB_CREDENTIALS_USR --password=$DOCKERHUB_CREDENTIALS_PSW              		
            	echo 'Login Completed' 
            	'''
            }           
        }

        stage('Push the artifacts'){
           steps{
                script{
                    sh '''
                    echo 'Push to Repo1'
                    docker push varthinidochub/cicd-e2e:${BUILD_NUMBER}
                    docker run -d -p 8080:8080 varthinidochub/cicd-e2e:${BUILD_NUMBER}
                    '''
                }
            }
        }
        
        
        
      }
}
