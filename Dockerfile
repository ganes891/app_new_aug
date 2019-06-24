FROM ganesh891/devimage:latest
# Take the war and copy to webapps of tomcat
COPY /tmp/workspace/tomcat-dev/target/myweb-0.0.5.war /usr/local/tomcat/webapps/
