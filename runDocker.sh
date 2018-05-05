#!/bin/bash
set -e
export CUSTOM_NETWORK_NAME=local_netowrk
export JENKINS_PASSWORD=jenkins
export JENKINS_USERNAME=jenkins
export NUM_OF_SLAVE_EXECUTORS=2
export JENKINS_MASTER_URL=http://localhost:8080/
#docker network create ${CUSTOM_NETWORK_NAME}
docker-compose -f ./docker-compose.yaml up -d