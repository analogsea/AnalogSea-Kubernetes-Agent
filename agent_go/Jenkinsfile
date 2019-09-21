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
          sh 'docker build -t iexalt/analogsea-kubernetes-agent:$GIT_BRANCH-continuous-$BUILD_ID -t iexalt/analogsea-kubernetes-agent:$BUILD_TIMESTAMP -t iexalt/analogsea-kubernetes-agent:$GIT_COMMIT .'
        }

      }
    }
    stage('Push') {
      steps {
        container('docker') {
          sh 'docker login -u $DOCKER_HUB_CREDS_USR -p $DOCKER_HUB_CREDS_PSW'
          sh 'docker image push iexalt/analogsea-kubernetes-agent:$BUILD_TIMESTAMP'
          sh 'docker image push iexalt/analogsea-kubernetes-agent:$GIT_COMMIT'
          sh 'docker image push iexalt/analogsea-kubernetes-agent:$GIT_BRANCH-continuous-$BUILD_ID'
        }
      }
    }
  }


}
