#!/bin/bash

awsuser=$1
echo $awsuser

echo "Start execute script ----->"

#https://unix.stackexchange.com/questions/136794/how-to-use-sed-to-replace-all-characters-before-colon
key=$(cat $HOME/creds-$awsuser | grep AccessKeyId | sed -e 's/[", ]//g; s/.*://')
chmod 755 $HOME/creds-$awsuser
aws iam delete-access-key --access-key-id $key --user-name $awsuser

#To list the access keys defined for an IAM user, use the list-access-keys command.
rm -rf $HOME/creds-$awsuser

echo "-----> Script is finished!"
