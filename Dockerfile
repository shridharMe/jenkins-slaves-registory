
From jenkins/jnlp-slave
RUN curl --silent --location https://rpm.nodesource.com/setup_9.x | sudo bash -
RUN yum -y install nodejs
RUN yum install gcc-c++ make
