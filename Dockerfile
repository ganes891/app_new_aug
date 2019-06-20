FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY /tmp/workspace/tomcat-dev/target/*.war /usr/local/tomcat/webapps/
