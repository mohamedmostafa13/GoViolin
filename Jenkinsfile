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
            post
            {
                failure
                {
                    echo 'Build Failed !'
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
                        DOCKER_IMAGE.push()
                    }
                }
            }
            post
            {
                failure
                {
                    echo 'Push Failed !'
                }
            }
        }
       
    }
    post
    {
        success
        {
            echo 'Succeeded !'
        }
    }
}