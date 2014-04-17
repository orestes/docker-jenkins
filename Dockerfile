FROM debian
MAINTAINER Orestes Carracedo <orestes.ca@gmail.com>
EXPOSE 8080

RUN apt-get install -q -y openjdk-7-jre-headless

RUN mkdir -p /opt/jenkins
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /opt/jenkins/jenkins.war

RUN mkdir -p /var/lib/jenkins
RUN chown jenkins /var/lib/jenkins
USER jenkins
ENV JENKINS_HOME /var/lib/jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins/jenkins.war"]
