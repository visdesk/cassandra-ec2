NOTE
----
This is currently not being maintained. A better option might be 
http://incubator.apache.org/whirr/
or
http://github.com/digitalreasoning/PyStratus

Cassandra EC2 
-------------
This collection of scripts allows you to run Cassandra clusters on Amazon.com's 
Elastic Compute Cloud (EC2) service described at: http://aws.amazon.com/ec2


Getting started
---------------
Before you do anything make sure you follow the Amazon setup guide: 
http://docs.amazonwebservices.com/AWSEC2/latest/GettingStartedGuide/
  
To start a cluster:
1) Edit cassandra-ec2-env.sh (specify a version for a release or trunk for svn checkout)
2) Run create-cassandra-image to create an image
3) Run start-cassandra-machines with a cluster name and number of nodes to start
4) Modify a storage-conf.xml from one of the nodes, at minimum do the following
   a) Change the Keyspace setup as you require
   b) Set a couple of the nodes as seeds (use internal ip)
   c) Set number of replicas
   d) Change dirs to point to somewhere in /mnt/cassandra
   e) Remove value in listenaddress to allow Cassandra to bind to something other then localhost
5) Run start-cassandra-instances with clustername and the configuration file


How to contribute
-----------------
Feel free to make any changes and contribute them back. 
Check out the code at http://github.com/johanoskarsson/cassandra-ec2

If you want to make major changes it would probably be worth
starting over from http://svn.apache.org/viewvc/hadoop/common/trunk/src/contrib/cloud/



Known issues
------------
The EC2 instances are *not* suitable for production use. They store the data on the instance itself
and will disappear when the instance is shut down.


Credits
-------
These scripts are based off the ones for Hadoop: http://wiki.apache.org/hadoop/AmazonEC2
