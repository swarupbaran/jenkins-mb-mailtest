pipeline {
    agent any
    environment{
        filename=return [DATE: 'cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1'.execute().text]
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
