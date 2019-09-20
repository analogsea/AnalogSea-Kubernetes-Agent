pipeline {
  agent {
    kubernetes {
      yamlFile 'jenkins-defs/pod.yaml'
    }
  }
  environment {
    DOCKER_HUB_CREDS = credentials('iexalt-docker-creds')
  }

  stages {
    stage('Build') {
      steps {
        container('docker') {
          // git clone 'https://github.com/analogsea/hello-world.git'
          // sh 'docker build . -t '
          sh 'ls'
          sh 'docker ps'
          sh 'echo $BUILD_NUMBER'

          // sh ''
          // sh "git clone 'https://github.com/analogsea/hello-world.git' /etc/ballerina"
          // sh "ls /etc/ballerina"

          sh 'docker build -t iexalt/analogsea-kubernetes-agent:dev-continuous-$BUILD_ID -t iexalt/analogsea-kubernetes-agent:$BUILD_TIMESTAMP -t iexalt/analogsea-kubernetes-agent:$GIT_COMMIT .'
        }

      }
    }
    stage('Push') {
      steps {
        container('docker') {
          sh 'docker login -u $DOCKER_HUB_CREDS_USR -p $DOCKER_HUB_CREDS_PSW'
          sh 'docker images'
        }
      }
    }
  }


}
