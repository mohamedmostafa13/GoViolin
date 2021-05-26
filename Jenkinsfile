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
            {   try
                {
                    script 
                    {
                        DOCKER_IMAGE = docker.build IMAGE
                    }
                    mail bcc: '', body: 'Your Build Stage in pipeline for GoViolin has been successfully build.', cc: '', from: '', replyTo: '', subject: 'Successful Build - GoViolin Pipeline', to: 'a.ayman6000@gmail.com'
                }
                catch
                {
                    mail bcc: '', body: 'Your Build Stage in pipeline for GoViolin has been successfully build.', cc: '', from: '', replyTo: '', subject: 'Successful Build - GoViolin Pipeline', to: 'a.ayman6000@gmail.com'
                }           
            }
        }
        
        /*
        stage('Push')
        {
            steps
            {
                try
                {
                    script 
                    {
                        docker.withRegistry( '', DOCKERHUB_CREDENTIALS) 
                        {
                            DOCKER_IMAGE.push("$BUILD_NUMBER")
                            DOCKER_IMAGE.push('latest')
                        }
                    }
                    mail bcc: '', body: 'Your Push Stage in pipeline for GoViolin has been successfully executed.', cc: '', from: '', replyTo: '', subject: 'Successful Build - GoViolin Pipeline', to: 'a.ayman6000@gmail.com'

                }
                catch
                {
                    mail bcc: '', body: 'Your Push Stage in pipeline for GoViolin has Failed, Please Review the stage.', cc: '', from: '', replyTo: '', subject: 'Build Failed - GoViolin Pipeline', to: 'a.ayman6000@gmail.com'
                }
            }
        }
        */
        stage('Remove Docker Images From Server') 
        {
            steps
            {
                sh "docker rmi $IMAGE:$BUILD_NUMBER"
                sh "docker rmi $IMAGE:latest"
            }
        }
    }
}