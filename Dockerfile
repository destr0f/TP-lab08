FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV CMAKE_POLICY_VERSION_MINIMUM=3.5

RUN apt-get update
RUN apt-get install -y build-essential cmake git curl ca-certificates

COPY . /print
WORKDIR /print

RUN cmake -S . -B _build -DCMAKE_BUILD_TYPE=Release -DHUNTER_CONFIGURATION_TYPES=Release
RUN cmake --build _build

ENV LOG_PATH=/home/logs/log.txt

VOLUME /home/logs

WORKDIR /print/_build

ENTRYPOINT ["./demo"]
