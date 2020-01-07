FROM openjdk:8-jdk

RUN apt-get update && apt-get install -y cron perl

WORKDIR /opt/app
COPY ./ ./
RUN chmod +x /opt/app/bin/solo
RUN ./gradlew --no-daemon shadowJar

RUN echo "1,16,31,46 * * * * /opt/app/bin/solo -port=8071 java -jar /opt/app/build/libs/notify-1.0-SNAPSHOT-all.jar &>> /var/log/notify.log" | crontab -

CMD cron -f
