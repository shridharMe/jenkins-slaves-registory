# pipeline-example

docker run -d -p  jenkins-host:9080:80 jenkins-slave-lamp:latest -url http://jenkins-host:8080 -workDir=/home/jenkins/agent agent-secret-key agent-name 