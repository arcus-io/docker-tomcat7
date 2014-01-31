FROM base
MAINTAINER Arcus "http://arcus.io"
RUN apt-get -qq update
RUN apt-get install -y openjdk-7-jre-headless wget
RUN wget -O /tmp/tomcat7.tar.gz http://mirror.cogentco.com/pub/apache/tomcat/tomcat-7/v7.0.50/bin/apache-tomcat-7.0.50.tar.gz
RUN (cd /opt && tar zxf /tmp/tomcat7.tar.gz)
RUN (mv /opt/apache-tomcat* /opt/tomcat)
ADD ./run.sh /usr/local/bin/run
EXPOSE 8080
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
