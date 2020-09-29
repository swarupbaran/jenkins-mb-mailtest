#!/bin/bash

file_name=$(echo $RANDOM)
echo $file_name
success_failure=$1
job_base_name=$2

echo $success_failure
echo $job_base_name
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
} > /home/indiumsoftware/$file_name.html
