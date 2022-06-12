#!/bin/bash

awsuser=$1
echo $awsuser

echo "Start execute script ----->"

# check if aws cli is installed
echo "checking if aws cli is installed ......"

awscmd="aws --version"
$awscmd
echo status=$?

if [ $? -eq 0 ]
then
	echo "Success: AWS CLI is installed"
#	exit 0
else
	echo "Failure: AWS CLI is not installed"
	exit 1
fi

echo "creating Access key and Secret Access key for $awsuser ..."
aws iam create-access-key --user-name $awsuser > $HOME/creds-$awsuser

echo "-----> Script is finished!"