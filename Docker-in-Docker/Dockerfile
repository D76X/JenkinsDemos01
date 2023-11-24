FROM jenkins/jenkins:2.426.1-jdk17
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"

# this Dockerfile comes from: https://www.jenkins.io/doc/book/installing/docker/#on-windows
# It builds an image based on jenkins/jenkins:2.426.1-jdk17 and adds Docker CLI on top.
# This image is then a jenkins/jenkins:lst that can run Docker containers.
# This means that you can run a container based on the image jenkins/jenkins:2.426.1-jdk17
# and use it to interact with docker in that it can pseens Docker images inside it! 
#
# Dokeck-in-Docker:
# This is in essence what the whole topic of Doker-in-Docker is about!

