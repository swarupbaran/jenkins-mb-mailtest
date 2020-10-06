pipeline {
    agent any
    environment {
        filename = sh(script: "cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1", returnStdout: true).trim()
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
                env.GIT_REPO_NAME = env.GIT_URL.replaceFirst(/^.*\/([^\/]+?).git$/, '$1')
                sh '''
                      echo "Hello develop branch"           
                      echo $JOB_BASE_NAME
                      echo $filename
                      echo $GIT_REPO_NAME
                      echo "HELLO"
                   '''    
            }
    }
}
	post{
		always{
                        sh """./status.sh \"${currentBuild.currentResult}\" \"${JOB_BASE_NAME}\" \"${filename}\" """    
		}
                success{
                      script {
			if(env.BRANCH_NAME == "develop") {
                        sh ''' echo ${filename} '''
			emailext(
			subject: "[Jenkins Build, ${JOB_NAME}, ${currentBuild.result}] Build #${BUILD_ID}",
			body: '${FILE, path="/var/lib/jenkins/workspace/*.html"}',
			to: "sreekanthtagirise@gmail.com",
			mimeType: "text/html"
			)
			}
			sh ''' rm /var/lib/jenkins/workspace/\"${filename}\".html'''
		     }

		     script {
			if(env.BRANCH_NAME == "master") {
			emailext(
			subject: "[Jenkins Build, ${JOB_NAME}, ${currentBuild.result}] Build #${BUILD_ID}",
			body: '${FILE,path="/var/lib/jenkins/workspace/\\"${filename}\"_master.html"}',
			to: "sreekanthtagirise@gmail.com",
			mimeType: 'text/html'
			)
			}
                    }
                }
	}
}
