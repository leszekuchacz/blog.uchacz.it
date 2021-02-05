#!/bin/bash
set -e
#aws ecs list-tasks --cluster
#aws ecs describe-tasks --cluster $1 --tasks  $t

if [ -z "$1" ]; then
	echo "Write name of ecs cluster to list"
	exit 1
fi

if [ -z "${AWS_REGION}" ] || [ -z "${AWS_SECRET_ACCESS_KEY}" ]; then
	echo "Please export aws api configuration: AWS_REGION, AWS_SECRET_ACCESS_KEY,AWS_ACCESS_KEY_ID"
	exit 1
fi

aws ecs list-tasks --cluster $1 | jq -r .taskArns[] | while read t; do
  aws ecs describe-tasks --cluster $1 --tasks $t | jq  '.tasks[].containers[] | .name +" "+ .runtimeId' -r

done
