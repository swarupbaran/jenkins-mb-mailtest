#!/bin/bash

success_failure=$1
job_base_name=$2
file_name=$3

echo $success_failure
echo $job_base_name
echo $file_name
if [[ $job_base_name == "develop" ]]
then
{
echo "<!DOCTYPE html>"
echo "<html>"
echo "<head>"
echo "<title>Page Title</title>"
echo "</head>"
echo "<body>"

echo "<h1>My First Heading</h1>"
echo "<p>My first paragraph.</p>"

echo "</body>"
echo "</html>"
} > /var/lib/jenkins/workspace/${file_name}_dev.html
elif [[ $job_base_name == "master" ]]
then
{
echo "<!DOCTYPE html>"
echo "<html>"
echo "<head>"
echo "<title>Page Title</title>"
echo "</head>"
echo "<body>"

echo "<h1>My First Heading</h1>"
echo "<p>My first paragraph.</p>"

echo "</body>"
echo "</html>"
} > /var/lib/jenkins/workspace/${file_name}_master.html
fi
 

