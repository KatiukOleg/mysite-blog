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
aws iam create-access-key --user-name $awsuser --profile $AWS_DEFAULT_PROFILE > $HOME/creds-$awsuser

# set environment variables
key=$(cat $HOME/creds-$awsuser | grep AccessKeyId | sed -e 's/[", ]//g; s/.*://')
secretKey=$(cat $HOME/creds-$awsuser | grep SecretAccessKey | sed -e 's/[", ]//g; s/.*://')
echo "export AWS_ACCESS_KEY_ID=$key" >> $HOME/.bash_profile
echo "export AWS_SECRET_ACCESS_KEY=$secretKey" >> $HOME/.bash_profile
#source $HOME/.bash_profile
#run this command manually. 
. $HOME/.bash_profile

echo "-----> Script is finished!"