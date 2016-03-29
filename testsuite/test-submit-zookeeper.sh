#!/bin/sh

SubmitZookeeperTests() {
    if [ "${zookeepertests}" == "y" ]
    then
	if [ "${standardtests}" == "y" ]
	then
	    for zookeeperversion in 3.4.0 3.4.1 3.4.2 3.4.3 3.4.4 3.4.5 3.4.6 3.4.7
	    do
		BasicJobSubmit magpie.${submissiontype}-zookeeper-${zookeeperversion}-zookeeper-networkfs-run-zookeeperruok
		BasicJobSubmit magpie.${submissiontype}-zookeeper-${zookeeperversion}-zookeeper-local-run-zookeeperruok
		
		BasicJobSubmit magpie.${submissiontype}-zookeeper-${zookeeperversion}-zookeeper-networkfs-run-zookeeperruok-no-local-dir
		BasicJobSubmit magpie.${submissiontype}-zookeeper-${zookeeperversion}-zookeeper-local-run-zookeeperruok-no-local-dir
	    done
	fi

  	# No Zookeeper Dependency Tests
	if [ "${dependencytests}" == "y" ]
	then
	fi
    fi
}