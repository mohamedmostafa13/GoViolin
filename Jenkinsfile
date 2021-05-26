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
                    publishHTML target: 
                    [
                        allowMissing: false,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'coverage',
                        reportFiles: 'index.html',
                        reportName: 'RCov Report'
                    ]
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
                    publishHTML target: 
                    [
                        allowMissing: false,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'coverage',
                        reportFiles: 'index.html',
                        reportName: 'RCov Report'
                    ]
                }
            }
        }
        stage('Remove Docker Images From Lacalhost') 
        {
            steps
            {
                sh "docker rmi $IMAGE"
            }
            post
            {
                failure
                {
                    publishHTML target: 
                    [
                        allowMissing: false,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'coverage',
                        reportFiles: 'index.html',
                        reportName: 'RCov Report'
                    ]
                }
            }
        }
    }
    post
    {
        success
        {
            publishHTML target: 
            [
                allowMissing: false,
                alwaysLinkToLastBuild: false,
                keepAll: true,
                reportDir: 'coverage',
                reportFiles: 'index.html',
                reportName: 'RCov Report'
            ] 
        }
    }
}