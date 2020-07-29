# Pull base image 
From tomcat:8-jre8 

COPY ./webapp.war /usr/local/tomcat/webapps
