pipeline {
    agent any
    environment{
        filename=sh(returnStdout: true, script: 'echo $RANDOM')
    }
    stages {
        stage ('Compile Stage') {
	    when {
              branch 'master'
            }
            steps {
                sh '''
                      echo "Hello master branch"
                   '''    
            }
        }
        stage ('Testing Stage') {
             when {
                branch 'develop'
            }

            steps {
                sh '''
                      echo "Hello develop branch"           
                   '''    
            }
    }
}
	post{
		always{
                        sh """ ./status.sh \"${currentBuild.currentResult}\" \"${JOB_BASE_NAME}\" \"${filename}\" """
		}
	}
}
