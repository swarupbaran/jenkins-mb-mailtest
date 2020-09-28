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
		      echo ${JOB_NAME}
		      echo ${JOB_BASE_NAME}
                   '''    
            }
    }
}
	post{
		always{
			sh '''
                            export success_failure=${currentBuild.currentResult}
                            export job_base_name=${JOB_BASE_NAME}
                           '''
                        sh """./status.sh \"${currentBuild.currentResult}\" """
		}
	}
}
