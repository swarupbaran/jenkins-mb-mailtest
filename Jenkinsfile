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
		      SREEKANTH
                   '''    
            }
    }
}
	post{
		always{
			sh "echo ${currentBuild.currentResult}"
		}
	}
}
