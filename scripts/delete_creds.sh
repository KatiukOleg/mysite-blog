#!/bin/bash

awsuser=$1
echo $awsuser

echo "Start execute script ----->"

key=$(cat $HOME/creds-$awsuser | grep AccessKeyId | sed -e 's/[", ]//g; s/.*://')
aws iam delete-access-key --access-key-id $key --user-name $awsuser

#To list the access keys defined for an IAM user, use the list-access-keys command.
rm -rf $HOME/creds-$awsuser

echo "-----> Script is finished!"
