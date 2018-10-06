FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD target/thinkpro-eureka-0.0.1-SNAPSHOT.jar thinkpro-eureka.jar
RUN sh -c 'touch /thinkpro-eureka.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/thinkpro-eureka.jar"]
EXPOSE 8761