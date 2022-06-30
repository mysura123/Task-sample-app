pipeline {
  agent any

  stages {
    stage('Hello') {
      steps {
        sh '''
          git --version
          npm install
          npm start
        '''
      }
    }
  }
}
