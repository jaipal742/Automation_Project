pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sleep 2
        echo 'executing build stage'
        sh 'echo "you can run npm/maven"'
      }
    }

  }
  environment {
    task = 'Demo'
    tag = '0.2.4'
  }
}