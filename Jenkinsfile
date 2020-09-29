pipeline {
    agent any
    environment{
       filename="file"
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
                               filename="Hello Arun"
                               echo ${filename}
                        }
                         
                        sh ''' echo ${filename} '''

                        sh """ ./status.sh \"${currentBuild.currentResult}\" \"${JOB_BASE_NAME}\" \"${filename}\" """
                           
		}
	}
}
