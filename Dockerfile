FROM openjdk:8-jdk

RUN apt-get update && apt-get install -y cron

WORKDIR /opt/app
COPY ./ ./

RUN ./gradlew --no-daemon shadowJar

RUN echo "1,16,31,46 * * * * java -jar /opt/app/build/libs/nofity-1.0-SNAPSHOT-all.jar" | crontab -

CMD cron -f
