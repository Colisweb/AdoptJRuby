FROM amazoncorretto:8u202

RUN yum update -y && \
    yum install -y tar && \
    curl https://downloads.lightbend.com/scala/2.12.8/scala-2.12.8.tgz --output scala-2.12.8.tgz && \
    tar -xvzf scala-2.12.8.tgz

ENV JAVA_TOOL_OPTIONS="-XX:+PrintFlagsFinal"

COPY script/. .

CMD ./scala-2.12.8/bin/scala Main