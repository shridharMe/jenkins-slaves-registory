
FROM jenkins/jnlp-slave
ENV TERRAFORM_VERSION=0.11.7
ENV NODEJS_VERSION=9
USER root
RUN  curl -sL https://deb.nodesource.com/setup_"${NODEJS_VERSION}".x | bash -
RUN apt-get install nodejs -y
RUN apt-get install git-core -y
RUN dpkg -L git
RUN apt-get install python python-pip -y
RUN pip install awscli 
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod +x /usr/local/bin/ecs-cli
RUN wget https://releases.hashicorp.com/terraform/"${TERRAFORM_VERSION}"/terraform_"${TERRAFORM_VERSION}"_linux_amd64.zip
RUN unzip terraform_"${TERRAFORM_VERSION}"_linux_amd64.zip
RUN mv terraform /usr/local/bin/
USER jenkins
RUN  terraform --version && aws --version && echo "node:" && node --version

