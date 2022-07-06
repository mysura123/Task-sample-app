pipeline {
   tools {
        nodejs 'nodejs'
    }
    agent any
    environment {
        registry = "938869457425.dkr.ecr.us-east-1.amazonaws.com/myapp:latest"
       
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
                sh 'docker push 938869457425.dkr.ecr.us-east-1.amazonaws.com/myapp:latest'
         }
        }
      }

       stage('K8S Deploy') {
        steps{   
            script {
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'K8SS', namespace: '', serverUrl: '') {
    // some block
                sh 'kubectl apply -f mongoheadless.yml 
                sh 'kubectl apply -f mongostateful.yml'
                sh 'kubectl apply -f ecr-to-eks.yaml'
                }
            }
        }
       }
    }
}
