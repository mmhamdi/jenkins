pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scmGit(
          branches: [[name: '*/main']],
          extensions: [],
          userRemoteConfigs: [[
            credentialsId: 'mmhamdi',
            url: 'https://github.com/mmhamdi/jenkins.git'
          ]]
        )
      }
    }

    stage('Install Dependencies If package.json Changed') {
      when {
        changeset '**/package.json'
      }
      steps {
        echo "Detected change in package.json. Here are the changes:"

        script {
          def diffOutput = sh(
            script: 'git diff HEAD^ HEAD -- package.json || true',
            returnStdout: true
          ).trim()
          echo diffOutput ?: "No visible diff, maybe added or deleted."
        }
      }
    }
  }
}
