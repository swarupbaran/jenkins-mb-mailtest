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
                      echo ${WORKSPACE}
		      echo ${UPSTREAM_BUILD_DIR}
		      echo ${UPSTREAM_BUILD_NR}
                   '''    
            }
    }
}
	post{
		always{
			sh '''
			    
			   '''
		}
	}
}
