pipeline {
    agent any

    stages {
        stage('SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/PriyaSenthilnathan/simpleWebApp.git'
            }
        }
        stage('Build'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('build to images'){
            steps{
                script{
                    sh 'docker build -t priyasenthil25/simpleapp .'
                }
            }
        }
stage('push to hub'){
steps{
script{
withDockerRegistry(credentialsId: 'Docker_cred' , url: 'https://index.docker.io/v1/'){
sh 'docker push priyasenthil25/simpleapp'
}
}
}
}
    }
}
