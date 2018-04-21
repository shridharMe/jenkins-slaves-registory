
FROM jenkins/jnlp-slave
ENV TERRAFORM_VERSION=0.11.7
ENV NODEJS_VERSION=9
USER root

#installing Nodejs

RUN apt-get update -y  &&  apt-get upgrade -y 

RUN  curl -sL https://deb.nodesource.com/setup_"${NODEJS_VERSION}".x | bash - && \
apt-get install nodejs -y

#installing Git

RUN apt-get install git-core -y &&  dpkg -L git

#installing AWS Cli
RUN apt-get install python python-pip -y &&  pip install awscli

#installing ECS Cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && chmod +x /usr/local/bin/ecs-cli

#installing Terraform
RUN wget https://releases.hashicorp.com/terraform/"${TERRAFORM_VERSION}"/terraform_"${TERRAFORM_VERSION}"_linux_amd64.zip && \
 unzip terraform_"${TERRAFORM_VERSION}"_linux_amd64.zip && \
 mv terraform /usr/local/bin/

USER jenkins
RUN  terraform --version && aws --version && echo "node:" && node --version

