pipeline {
    agent any
    environment{
       filename=sh(returnStdout: true, script: 'date')
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
                        sh ''' echo $filename '''
                                                
                        script{
                               sh ''' export file_name = $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1) '''
                              }
                         
                        sh ''' echo $filename '''

                        sh """ ./status.sh \"${currentBuild.currentResult}\" \"${JOB_BASE_NAME}\" \"${filename}\" """
                           
		}
	}
}
