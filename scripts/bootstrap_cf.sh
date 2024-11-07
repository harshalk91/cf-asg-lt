#!/bin/bash

# Display help message
function help() {
  echo "Usage: $0 -n NAME -s INSTANCE_COUNT"
  echo "Example: ./bootstrap_cf.sh -n awesome -s 2"
  echo "  -n NAME        Name for the created resources (mandatory)"
  echo "  -s INSTANCE_COUNT  Number of instances in the Auto Scaling Group"
  echo "  -h                 Help"
}

# Parse options
while getopts "n:s:h" opt; do
  case $opt in
    n) NAME=$OPTARG ;;
    s) INSTANCE_COUNT=$OPTARG ;;
    h) help; exit 0 ;;
    *) help; exit 1 ;;
  esac
done

# Validate required parameter
if [ -z "$NAME" ]; then
  echo "Error: -n NAME is required"
  help
  exit 1
fi

# Create Stack
aws cloudformation create-stack \
  --stack-name "${NAME}-stack" \
  --template-body file://../cf_templates/asg_lt.yaml \
  --parameters ParameterKey=Name,ParameterValue=$NAME ParameterKey=InstanceCount,ParameterValue=$INSTANCE_COUNT \
  --capabilities CAPABILITY_NAMED_IAM

