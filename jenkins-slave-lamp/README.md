# pipeline-example

java -jar jenkins-cli.jar -s [JENKINS_URL] create-node docker_lamp
docker run -d -p  host-port:80 jenkins-slave-lamp:latest -url http://jenkins-host:port -workDir=/home/jenkins/agent agent-secret-key docker_lamp 