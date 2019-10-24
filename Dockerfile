FROM openjdk:8-jre-alpine

FROM bigtruedata/scala:2.10.6

Run wget -O- "https://github.com/sbt/sbt/releases/download/v0.13.15/sbt-0.13.15.tgz" \
    |  tar xzf - -C /usr/local --strip-components=1 \
    && sbt exit

VOLUME /app
WORKDIR /app

CMD sbt assembly

COPY target/scala-2.12/akka-http-basic-for-pipeline-assembly-0.1.0-SNAPSHOT.jar /
CMD java -jar akka-http-basic-for-pipeline-assembly-0.1.0-SNAPSHOT.jar
