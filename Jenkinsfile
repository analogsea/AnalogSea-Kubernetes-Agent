pipeline {
  agent {
    kubernetes {
      yamlFile 'jenkins-defs/pod.yaml'
//       yaml """
// spec:
//
//
//
//   containers:
//   - name: docker
//     env:
//       - name: BUILD_MEME_NUM
//         value: test
//
//       """
    }
  }

  stages {
    stage('Build') {
      steps {

        // container('ballerina') {
        //
        // }

        container('docker') {
          // git clone 'https://github.com/analogsea/hello-world.git'
          // sh 'docker build . -t '
          sh 'ls'
          sh 'docker ps'
          sh 'echo $BUILD_NUMBER'
          // sh "git clone 'https://github.com/analogsea/hello-world.git' /etc/ballerina"
          // sh "ls /etc/ballerina"
        }

      }
    }
    // stage('Push') {
    //   steps {
    //     container('docker') {
    //
    //     }
    //   }
    // }
  }


}
