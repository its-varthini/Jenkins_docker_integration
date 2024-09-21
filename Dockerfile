FROM tomcat:8.0-alpine

LABEL maintainer=”varthini@gmail.com”

ADD target/* /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh","run"]
