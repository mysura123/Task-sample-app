pipeline {
  agent any

  stages {
    stage('Hello') {
      steps {
        sh '''
          git --version
          ansible-playbook --version
          ansible-galaxy --version
        '''
      }
    }
  }
}
