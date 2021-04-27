FROM centos
MAINTAINER "ratna kumar"
RUN yum install wget -y && yum install java -y
RUN mkdir -p /usr/local/tomcat
WORKDIR /opt/
RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.65/bin/apache-tomcat-8.5.65.zip
RUN yum install unzip -y
RUN unzip apache-tomcat-8.5.65.zip && rm -rf unzip apache-tomcat-8.5.65.zip
RUN mv apache-tomcat-8.5.65 /opt/tomcat8
RUN useradd tomcat && chown -R tomcat:tomcat /opt/tomcat8
RUN chmod -R 777 /opt/tomcat8/
CMD chmod +x /opt/tomcat8/bin/catalina.sh
RUN cp -Rv /opt/tomcat8/* /usr/local/tomcat
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]
ENV PROJECT_HOME /usr/local/tomcat/webapps/
COPY /target/MavenProject.war $PROJECT_HOME/MavenProject.war


