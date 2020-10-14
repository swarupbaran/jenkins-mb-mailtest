pipeline {
    agent any
    environment {
        filename = sh(script: "cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1", returnStdout: true).trim()	
	basePath = '/home/jenkins/'
	fullFileName = "$basePath" + "$filename" + ".html"
        GIT_REPO_NAME = env.GIT_URL.replaceFirst(/^.*\/([^\/]+?).git$/, '$1')
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
                expression { BRANCH_NAME != 'master' && BRANCH_NAME == 'develop' }
            }

            steps {
                sh '''
                      echo "Hello develop branch"           
                      echo $JOB_BASE_NAME
                      echo ${WORKSPACE}
                      echo $filename
                      echo $GIT_REPO_NAME
                      echo "HELLO VARIABLE COMING"
		      echo ${fullFileName}
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
			if(env.GIT_REPO_NAME == "jenkins-mb-mailtest"){
				if(env.BRANCH_NAME == "develop") {
       				
				sh 'echo "my full path is ${fullFileName}"'
				//sh 'echo cat ${fullFileName}'
				emailFileContent = sh 'cat "/home/jenkins/${filename}.html"'
				emailFileContent = sh(returnStdout: true, script: 'cat /home/jenkins/${filename}.html')
				sh  'echo "my content is ${emailFileContent}"'
				emailext(
				subject: "[Jenkins Build, ${JOB_NAME}, ${currentBuild.result}] Build #${BUILD_ID}",
				//body: "${FILE, path=$variable}",
				body: '{FILE, path=$variable}',
					
				to: "swarup.baran@lamresearch.com",
				mimeType: "text/html"
				)
				sh ''' rm /home/jenkins/\"${filename}\".html'''
				}
			}
		     }

		     script {
			if(env.GIT_REPO_NAME == "jenkins-mb-mailtest"){
				if(env.BRANCH_NAME == "master") {
					emailext(
					subject: "[Jenkins Build, ${JOB_NAME}, ${currentBuild.result}] Build #${BUILD_ID}",
					body: '${FILE,path="/var/jenkins_home/workspace/\"${filename}\".html"}',
					to: "sreekanthtagirise@gmail.com",
					mimeType: 'text/html'
					)
				sh ''' rm /var/jenkins_home/workspace/\"${filename}\".html'''
				}
			}
                    }
                }
	}
}
