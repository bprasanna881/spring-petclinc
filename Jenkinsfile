
pipeline {
    
    environment {
    imagename = "varaprasadthatisetti/mynewpetclinic"
    registryCredential = 'mypipelinedockercreds'
    dockerImage = ''
  }
    agent {label 'worker1'}

    stages {
        
        
        
        stage('git') {
            steps {
                echo 'clonning Repository'
                git branch: 'main', url: 'https://github.com/mnagen/spring-petclinic.git'
                
                echo 'Repo clone successfully'
            }
            
        }
        
        
       stage('BUILD') {
            steps {
                echo 'Build the code'
                sh './mvnw package'
            }
       }
            
            
            
            
            stage('DOCKERIZE') {
            steps {
                echo 'Deploy the code'
                
                script {
                    
                     dockerImage = docker.build imagename 
                    
                }
                  
                
            } 
                
            }  
            
            
            stage('push') {
            steps {
                echo 'push image'
                script{
                    
                 docker.withRegistry( '', registryCredential ) {
                  dockerImage.push("$BUILD_NUMBER")
                  dockerImage.push('latest')
                 }}

          }
                
                
                
                
            }
        
        
        
        
        
        stage('Remove Unused docker image') {
steps{
sh "docker rmi $imagename:$BUILD_NUMBER"
sh "docker rmi $imagename:latest"
    
    
}}
        } 
        
        
        
        
        
        
        
    }
    
    
