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
          sh 'ls'
          sh 'docker ps'
          sh 'echo $BUILD_NUMBER'
          sh 'docker build -t iexalt/analogsea-kubernetes-agent:dev-continuous-$BUILD_ID -t iexalt/analogsea-kubernetes-agent:$BUILD_TIMESTAMP -t iexalt/analogsea-kubernetes-agent:$GIT_COMMIT .'
        }

      }
    }
    stage('Push') {
      steps {
        container('docker') {
          sh 'docker login -u $DOCKER_HUB_CREDS_USR -p $DOCKER_HUB_CREDS_PSW'
          sh 'docker push iexalt/analogsea-kubernetes-agent'
        }
      }
    }
  }


}
