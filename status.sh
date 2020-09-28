#success_failure=${currentBuild.currentResult}
#echo $success_failure
#echo "Hello"
#echo """${env.currentBuild.currentResult}"""
#echo """${currentBuild.currentResult}"""
#echo $success_failure
#echo """${env.JOB_BASE_NAME}"""
#echo """${JOB_BASE_NAME}"""

success_failure=$1
job_base_name=$2

echo $success_failure
echo $job_base_name
