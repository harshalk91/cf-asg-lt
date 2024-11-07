#!/bin/bash

# Display help message
function help() {
  echo "Usage: $0 -n NAME"
  echo "Example: ./delete_cf.sh -n awesome"
  echo "  -n NAME        Resource to be deleted(mandatory)"
  echo "  -h             Help"
}

# Parse options
while getopts "n:h" opt; do
  case $opt in
    n) NAME=$OPTARG ;;
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

# Delete Stack
aws cloudformation delete-stack --stack-name $NAME-stack
