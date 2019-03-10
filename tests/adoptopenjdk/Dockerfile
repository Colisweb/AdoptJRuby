FROM adoptopenjdk/openjdk11:jdk-11.0.2.9-slim

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y curl && \
    curl https://downloads.lightbend.com/scala/2.12.8/scala-2.12.8.tgz --output scala-2.12.8.tgz && \
    tar -xvzf scala-2.12.8.tgz

ENV JAVA_TOOL_OPTIONS="-XX:+UseContainerSupport -XX:+PrintFlagsFinal"

COPY script/. .

CMD ./scala-2.12.8/bin/scala Main