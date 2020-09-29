pipeline {
    agent any

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
                        sh ''' echo ${BUILD_URL} '''
                        sh ''' echo ${currentBuild.durationString} '''
                        sh """./status.sh \"${currentBuild.currentResult}\" \"${JOB_BASE_NAME}\"  """

		}
                success{
                        sh '''rm /var/lib/jenkins/workspace/*_uat.html'''
                }
	}
}
