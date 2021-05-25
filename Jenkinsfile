pipeline
{
    environment
    {
        IMAGE = 'a7medayman6/goviolin'
        DOCKERHUB_CREDENTIALS = 'dockerhub'
        DOCKER_IMAGE = ''
    }
    agent any
    stages
    {
        stage('Build')
        {
            steps
            {   
                script 
                {
                    DOCKER_IMAGE = docker.build IMAGE
                }
                
            }
        }
        stage('Push')
        {
            steps
            {
                script 
                {
                    docker.withRegistry( '', DOCKERHUB_CREDENTIALS) 
                    {
                        DOCKER_IMAGE.push("$BUILD_NUMBER")
                        DOCKER_IMAGE.push('latest')
                    }
                }
            }
        }
        stage('Remove Docker Images From Lacalhost') 
        {
            steps
            {
                sh "docker rmi $IMAGE:$BUILD_NUMBER"
                sh "docker rmi $IMAGE:latest"
            }
        }
    }
}