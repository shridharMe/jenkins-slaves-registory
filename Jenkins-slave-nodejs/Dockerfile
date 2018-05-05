FROM openjdk

ARG TERRAFORM_VERSION=0.11.7
ARG NODEJS_VERSION=9
ARG DEBIAN_FRONTEND=noninteractive
ARG SWARM_CLIENT=3.9

ENV SLAVE_EXECUTORS=1
ENV SLAVE_DESCRIPTION="core jenkins slave for nodejs stack"
ENV SWARM_MASTER="http://localhost:8080"
ENV SWARM_USER="jenkins"
ENV SWARM_PASSWORD="jenkins"
ENV SLAVE_NAME="SLAVE_NODEJS"
ENV SLAVE_LABELS="NODEJS"
ENV SLAVE_MODE="exclusive"
 
USER root
RUN apt-get update -y  && \
    apt-get upgrade -y --no-install-recommends apt-utils && \
    apt-get install software-properties-common -y && \
    apt-get install git-core -y &&  dpkg -L git && \ 
    apt-get --purge autoremove -y

#installing Nodejs
RUN  curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION}.x | bash - && \
apt-get install nodejs -y
#installing AWS Cli

RUN apt-get install python python-pip -y &&  pip install awscli

#installing ECS Cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && chmod +x /usr/local/bin/ecs-cli

#installing Terraform
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
 unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
 mv terraform /usr/local/bin/


RUN  terraform --version && aws --version && echo "node:" && node --version && java -version

# Start Swarm-Client
RUN curl -s -o /bin/swarm-client.jar -k http://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT}/swarm-client-${SWARM_CLIENT}.jar
# Start Swarm-Client
CMD java -jar /bin/swarm-client.jar -executors ${SLAVE_EXECUTORS}  -description "${SLAVE_DESCRIPTION}" -master ${SWARM_MASTER}  -username ${SWARM_USER} -password ${SWARM_PASSWORD} -name "${SLAVE_NAME}" -labels "${SLAVE_LABELS}" -mode ${SLAVE_MODE}