FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get -y install \
    build-essential \
    gcc \
    git \
    gdb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app/
CMD [ "bash" ]
