#!/bin/bash

##########################
# Author: kaza
# Date: March 03,2023
# version: V1
#
# This script will report the resource usage
#########################


set -x 

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM-Users

date > resourceTracker

#List s3 buckets
echo "Print list of s3 buckets" >> resourceTracker
aws s3 ls  >> resourceTracker

#List EC2 instances
echo "Print list of ec2 instances" >> resourceTracker
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker


#List AWS Lambda
echo "Print list of lambda instances" >> resourceTracker
aws lambda list-functions >> resourceTracker

#List IAM users
echo "Print list of iam users" >> resourceTracker
aws iam list-users >> resourceTracker
