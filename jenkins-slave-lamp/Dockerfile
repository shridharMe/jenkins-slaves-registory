FROM jenkins/jnlp-slave

USER root
ENV MYSQL_PASS="admin" 
ENV SITE_SAMPLE="create"
ENV TERRAFORM_VERSION=0.11.7

RUN apt-get update -y  &&  apt-get upgrade -y 
RUN apt-get install git-core -y &&  dpkg -L git

RUN apt-get install apache2 -y && \
apt-get install mysql-server -y && \
apt-get install php7.0 php-pear php7.0-mysql -y
COPY ./info.php /var/www/html

RUN apt-get install python python-pip -y && pip install awscli 

RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
 chmod +x /usr/local/bin/ecs-cli

RUN wget https://releases.hashicorp.com/terraform/"${TERRAFORM_VERSION}"/terraform_"${TERRAFORM_VERSION}"_linux_amd64.zip && \
  unzip terraform_"${TERRAFORM_VERSION}"_linux_amd64.zip && \
  mv terraform /usr/local/bin/ 
RUN  terraform --version && aws --version && php -v &&  java -version

EXPOSE 80 3306
CMD ["/etc/init.d/apache2" ,"restart"]