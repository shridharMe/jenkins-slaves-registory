# pipeline-example

java -jar jenkins-cli.jar -s [JENKINS_URL] create-node docker_nodejs

docker run -d -p  jenkins-slave-nodejs:latest -url http://jenkins-host:port -workDir=/home/jenkins/agent agent-secret-key docker_nodejs 