# Set environment variables for running Cassandra on Amazon EC2 here. All are required.

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Your Amazon Account Number.
AWS_ACCOUNT_ID=

# Your Amazon AWS access key.
AWS_ACCESS_KEY_ID=

# Your Amazon AWS secret access key.
AWS_SECRET_ACCESS_KEY=

# Location of EC2 keys.
# The default setting is probably OK if you set up EC2 following the Amazon Getting Started guide.
EC2_KEYDIR=`dirname "$EC2_PRIVATE_KEY"`

# The EC2 key name used to launch instances.
# The default is the value used in the Amazon Getting Started guide.
KEY_NAME=gsg-keypair

# Where your EC2 private key is stored (created when following the Amazon Getting Started guide).
# You need to change this if you don't store this with your other EC2 keys.
PRIVATE_KEY_PATH=`echo "$EC2_KEYDIR"/"id_rsa-$KEY_NAME"`

# SSH options used when connecting to EC2 instances.
SSH_OPTS=`echo -i "$PRIVATE_KEY_PATH" -o StrictHostKeyChecking=no -o ServerAliveInterval=30`

# The version of Cassandra to use.
CASSANDRA_VERSION=trunk

# The Amazon S3 bucket where the Cassandra AMI is stored.
# Change this value to a bucket where you have permission to write.
S3_BUCKET=your-own-s3-bucket

# The script to run on instance boot.
USER_DATA_FILE=cassandra-ec2-init-remote.sh

# The EC2 instance type: m1.small, m1.large, m1.xlarge
INSTANCE_TYPE="m1.small"
#INSTANCE_TYPE="m1.large"
#INSTANCE_TYPE="m1.xlarge"
#INSTANCE_TYPE="c1.medium"
#INSTANCE_TYPE="c1.xlarge"

#
# The following variables are only used when creating an AMI.
#

# SUPPORTED_ARCHITECTURES = ['i386', 'x86_64']
if [ "$INSTANCE_TYPE" == "m1.small" -o "$INSTANCE_TYPE" == "c1.medium" ]; then
  ARCH='i386'
  BASE_AMI_IMAGE="ami-dcf615b5"
else
  ARCH='x86_64'
  BASE_AMI_IMAGE="ami-f0f61599" 
fi

#if [ "$INSTANCE_TYPE" == "c1.medium" ]; then
#  AMI_KERNEL=aki-9b00e5f2 # ec2-public-images/vmlinuz-2.6.18-xenU-ec2-v1.0.i386.aki.manifest.xml
#fi
#
#if [ "$INSTANCE_TYPE" == "c1.xlarge" ]; then
#  AMI_KERNEL=aki-9800e5f1 # ec2-public-images/vmlinuz-2.6.18-xenU-ec2-v1.0.x86_64.aki.manifest.xml
#fi
#
#if [ "$AMI_KERNEL" != "" ]; then
#  KERNEL_ARG="--kernel ${AMI_KERNEL}"
#fi
