FROM gradle

COPY . /app

WORKDIR /app

EXPOSE 1234

USER root

RUN gradle build
RUN gradle installDist

CMD ["/app/build/install/next-number-app/bin/next-number-app", "1234"]
