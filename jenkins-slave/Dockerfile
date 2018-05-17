FROM centos:7

ARG TERRAFORM_VERSION=0.11.7
ARG NODEJS_VERSION=9
ARG PHP_VERSION=7.0
ARG SWARM_CLIENT=3.9
ARG SLAVE_EXECUTORS=1
ARG DEBIAN_FRONTEND=noninteractive

ENV SLAVE_DESCRIPTION="core jenkins slave"
ENV SWARM_MASTER="http://localhost:8080"
ENV SWARM_USER="jenkins"
ENV SWARM_PASSWORD="jenkins"
ENV SLAVE_NAME="SLAVE_LAMP"
ENV SLAVE_LABELS="NODEJS"
ENV SLAVE_MODE="exclusive"

USER root
RUN yum update -y   
RUN yum install curl -y 
RUN yum install wget -y 
RUN yum install unzip -y 
RUN yum install java -y
#RUN yum install software-properties-common -y  
RUN yum install git-core -y  
 
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN yum install python python-pip -y && pip install awscli 

RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
chmod +x /usr/local/bin/ecs-cli

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform_"${TERRAFORM_VERSION}"_linux_amd64.zip && \
  mv terraform /usr/local/bin/ 
RUN  terraform --version && aws --version  &&  java -version

# Make Jenkins a slave by installing swarm-client
RUN curl -s -o /bin/swarm-client.jar -k http://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT}/swarm-client-${SWARM_CLIENT}.jar
# Start Swarm-Client

CMD java -jar /bin/swarm-client.jar -executors ${SLAVE_EXECUTORS} -description "${SLAVE_DESCRIPTION}" -master "${SWARM_MASTER}"  -username "${SWARM_USER}" -password "${SWARM_PASSWORD}" -name "${SLAVE_NAME}" -labels "${SLAVE_LABELS}" -mode "${SLAVE_MODE}"
