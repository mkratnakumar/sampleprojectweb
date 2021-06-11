FROM centos
MAINTAINER "ratna kumar"
RUN yum install wget -y && yum install java -y
RUN mkdir -p /usr/local/tomcat
WORKDIR /opt/
ADD https://downloads.apache.org/tomcat/tomcat-8/v8.5.66/bin/apache-tomcat-8.5.66.zip /usr/local/tomcat/
RUN useradd tomcat  
RUN chown -R tomcat:tomcat /usr/local/tomcat/apache*
RUN chmod -R 777 /usr/local/tomcat/apache*
RUN mv /usr/local/tomcat/apache* /usr/local/tomcat/tomcat8
CMD chmod +x /usr/local/tomcat/tomcat8/bin/catalina.sh
EXPOSE 8080
RUN rm -rf /usr/local/tomcat/tomcat8/webapps/*
CMD ["/usr/local/tomcat/tomcat8/bin/catalina.sh","run"]

