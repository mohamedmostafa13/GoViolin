pipeline
{
    environment
    {
        IMAGE = 'a7medayman6/goviolin'
        DOCKERHUB_CREDENTIALS = 'dockerhub'
        DOCKER_IMAGE = ''
        K8S_DEPLOYMENT_FILE = 'deployment.yaml'
        K8S_SERVICE = 'goviolin-service'
        WEB_APP_URL = ''
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
                    try
                    {
                        DOCKER_IMAGE = docker.build IMAGE
                        echo 'Sending Success Mail to a.ayman6000@gmail.com ....'
                        echo ''
                        mail bcc: '', body: 'Your Build Stage in pipeline for GoViolin has been successfully build.', cc: '', from: '', replyTo: '', subject: 'Successful Build - GoViolin Pipeline', to: 'a.ayman6000@gmail.com'
                        echo 'Mail Sent.'
                    }
                    catch(all)
                    {
                        echo 'Sending Success Mail to a.ayman6000@gmail.com ....'
                        echo ''
                        mail bcc: '', body: 'Your Build Stage in pipeline for GoViolin has been successfully build.', cc: '', from: '', replyTo: '', subject: 'Successful Build - GoViolin Pipeline', to: 'a.ayman6000@gmail.com'
                        echo 'Mail Sent.'
                    }
                }          
            }
        }
        /* 
        stage('Push')
        {
            steps
            {
                script
                {
                    try
                    {
                        docker.withRegistry( '', DOCKERHUB_CREDENTIALS) 
                        {
                            DOCKER_IMAGE.push("$BUILD_NUMBER")
                            DOCKER_IMAGE.push('latest')
                        }
                        mail bcc: '', body: 'Your Push Stage in pipeline for GoViolin has been successfully executed.', cc: '', from: '', replyTo: '', subject: 'Successful Build - GoViolin Pipeline', to: 'a.ayman6000@gmail.com'
                    }
                    catch(all)
                    {
                        mail bcc: '', body: 'Your Push Stage in pipeline for GoViolin has Failed, Please Review the stage.', cc: '', from: '', replyTo: '', subject: 'Build Failed - GoViolin Pipeline', to: 'a.ayman6000@gmail.com'
                    }
                }
            }
        }
        */
        stage('Deploy to Kubernetes')
        {
            steps
            {
                script
                {
                    sh "kubectl apply -f ./${K8S_DEPLOYMENT_FILE}"
                    echo 'GOVIOLIN URL : '
                    WEB_APP_URL = sh(script: 'minikube service \${K8S_SERVICE} --url', returnStdout: true)
                    echo "${WEB_APP_URL}"
                    echo 'Sending Success Mail to a.ayman6000@gmail.com ....'
                    echo ''
                    mail bcc: '', body: 'Your Application Has been Successfully Deployed on K8s.', cc: '', from: '', replyTo: '', subject: 'Successful Deployement on Kubernetes, you can access your web App at ${WEB_APP_URL} - GoViolin Pipeline', to: 'a.ayman6000@gmail.com'
                    echo 'Mail Sent.'
                }
            }
        }
       
    }
}