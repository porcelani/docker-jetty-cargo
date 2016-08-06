FROM       jetty:9.3.8-jre8

# Install Cargo
ADD http://repo1.maven.org/maven2/org/codehaus/cargo/cargo-jetty-7-and-onwards-deployer/1.4.18/cargo-jetty-7-and-onwards-deployer-1.4.18.war /var/lib/jetty/webapps/cargo-jetty-7-and-onwards-deployer-1.4.18.war

VOLUME /usr/local/jetty

RUN chmod 777 -R /var/lib/jetty
RUN chmod 777 -R /usr/local/jetty

RUN apt-get update -qq
RUN apt-get install vim -y

CMD ["java","-Djava.io.tmpdir=/tmp/jetty","-jar","/usr/local/jetty/start.jar"]