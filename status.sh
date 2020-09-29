#!/bin/bash

success_failure=$1
job_base_name=$2
filename=$3
echo "Hello"
echo $success_failure
echo $job_base_name
echo $filename
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
} > /var/lib/jenkins/workspace/${filename}_uat.html
 

