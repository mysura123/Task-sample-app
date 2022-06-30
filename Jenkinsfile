pipeline {
  agent any

  stages {
    stage('Hello') {
      steps {
        sh '''
          git --version
          npm install
          npm start 
          tar czf nodejs-$BUILD_NUMBER.tar.gz .
        '''
      }
    }
  }
}
