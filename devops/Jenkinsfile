pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'githubtoken', url: 'https://github.com/PriyaSenthilnathan/restaurant.git']])
            }
        }
    }
    stage('Build Docker Image') {
    steps {
        script {
            sh 'docker build -t priyasenthil25/webhook .'
        }
    }
}

stage('Push Docker Image') {
    steps {
        withDockerRegistry([credentialsId: 'webhook-credential', url: '']) {
            sh 'docker push priyasenthil25/webhook'
        }
    }
}

}

