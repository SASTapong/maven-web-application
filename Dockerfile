FROM ubuntu
RUN echo "Run One Updated"
RUN echo "RUN TWO"
RUN echo "RUN Three"
CMD date
ENTRYPOINT [ "echo", "hello" ]


#git
FROM alpine/git as repo

MAINTAINER name hanseltapong@gmail.com

WORKDIR /app
RUN git clone https://github.com/SASTapong/maven-web-application.git

#Tomcat
FROM tomcat:8.0.20-jre8
COPY --from=build /app/target/maven-web-app*.war /usr/local/tomcat/webapps/maven-web-app.war
