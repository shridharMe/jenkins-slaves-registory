
FROM jenkins/jnlp-slave
USER root
RUN  curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install nodejs
RUN apt-get install git-core
RUN dpkg -L git
