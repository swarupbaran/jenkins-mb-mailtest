#success_failure=${currentBuild.currentResult}
#echo $success_failure
echo "Hello"
echo "${env.currentBuild.currentResult}"
echo "${currentBuild.currentResult}"

echo "${env.JOB_BASE_NAME}"
echo "${JOB_BASE_NAME}"
