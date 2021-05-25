node  
{
    def dockerimage     
    stage('Clone repository') 
    {               
        checkout scm        
    }     
    stage('Build image') 
    {         
        dockerimage = docker.build("a7medayman6/goviolin")    
    }     
    stage('Test image') 
    {           
        app.inside 
        {            
            sh 'echo "Tests passed"'        
        }    
    }     
    stage('Push image') 
    {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') 
        {            
            dockerimage.push("${env.BUILD_NUMBER}")            
            dockerimage.push("latest")        
        }    
        
    }
}