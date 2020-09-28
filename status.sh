#!/bin/bash
STATUS='Not set'
if [ ! -z $UPSTREAM_BUILD_DIR ];then
  ISFAIL=$(ls -l /var/lib/jenkins/jobs/$UPSTREAM_BUILD_DIR/builds | grep "lastFailedBuild\|lastUnsuccessfulBuild" | grep $UPSTREAM_BUILD_NR)
  ISSUCCESS=$(ls -l /var/lib/jenkins/jobs/$UPSTREAM_BUILD_DIR/builds | grep "lastSuccessfulBuild\|lastStableBuild" | grep $UPSTREAM_BUILD_NR)
  if [ ! -z "$ISFAIL" ];then
     echo $ISFAIL
     STATUS='FAIL'
  elif [ ! -z "$ISSUCCESS" ]
  then
     STATUS='SUCCESS'
  fi
fi
echo $STATUS
