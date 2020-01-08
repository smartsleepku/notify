FROM openjdk:8-jdk

RUN apt-get update && apt-get install -y cron perl

WORKDIR /opt/app
COPY ./ ./
RUN chmod +x /opt/app/bin/solo
RUN ./gradlew --no-daemon shadowJar

RUN echo "\
JAVA_HOME=/usr/local/openjdk-8\n\
JAVA_VERSION=8u232\n\
PWD=/opt/app\n\
HOME=/root\n\
PATH=/usr/local/openjdk-8/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\n\
\n\
1,16,31,46 * * * * /bin/bash /opt/app/bin/notify.sh" | crontab -

CMD cron -f
