pipeline {
   tools {
        nodejs 'nodejs'
    }
    agent any
    environment {
        registry = "938869457425.dkr.ecr.us-east-1.amazonaws.com/nodeapp"
    }
   
    stages {
      stage ('Build') {
          steps {
            sh 'npm install'           
            }
      }
    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry 
        }
      }
    }
   
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
     steps{  
         script {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 938869457425.dkr.ecr.us-east-1.amazonaws.com'
                sh 'docker push 938869457425.dkr.ecr.us-east-1.amazonaws.com/nodeapp:latest'
         }
        }
      }

       stage('K8S Deploy') {
        steps{   
            script {
                withKubeConfig([credentialsId: 'K8S', serverUrl: '']) {
                sh ('kubectl apply -f mongo-secret.yaml
                     kubectl apply -f mongo.yaml
                     kubectl apply -f mongo-configmap.yaml 
                     kubectl apply -f mongo-express.yaml')
                }
            }
        }
       }
    }
}
