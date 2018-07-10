FROM openjdk:8

WORKDIR /app

ADD . /app

EXPOSE 1234

RUN /app/gradlew build
RUN /app/gradlew installDist

CMD ["/app/build/install/next-number-app/bin/next-number-app", "1234"]
