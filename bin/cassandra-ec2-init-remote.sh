#!/usr/bin/env bash

################################################################################
# Script that is run on each EC2 instance on boot. It is passed in the EC2 user
# data, so should not exceed 16K in size.
################################################################################

################################################################################
# Initialize variables
################################################################################

SECURITY_GROUPS=`wget -q -O - http://169.254.169.254/latest/meta-data/security-groups`

CASSANDRA_HOME=`ls -d /usr/local/cassandra-*`

################################################################################
# Start services
################################################################################

[ ! -f /etc/hosts ] &&  echo "127.0.0.1 localhost" > /etc/hosts

mkdir -p /mnt/cassandra/logs
ln -s /mnt/cassandra/logs /var/log/cassandra
mkdir -p /mnt/cassandra/data
ln -s /mnt/cassandra/data /var/lib/cassandra

# not set on boot
export USER="root"

# Cassandra
#"$CASSANDRA_HOME"/bin/cassandra

# Run this script on next boot
rm -f /var/ec2/ec2-run-user-data.*
