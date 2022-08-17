# https://hub.docker.com/_/ubuntu
FROM ubuntu:22.04

# Configure
ARG TZ=Etc/UTC
ARG DEBIAN_FRONTEND=noninteractive

# Update
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y nocache

# See:
#   https://packages.ubuntu.com/

# GCC 11.2.0
RUN apt install -y gcc
RUN apt install -y g++

# make 4.3
RUN apt install -y make

# cmake 3.22.1
RUN apt install -y cmake

# Python 3.10.4
RUN apt install -y python3

# Java: SDKMan (https://sdkman.io/)
RUN apt install -y curl
RUN apt install -y zip
RUN apt install -y unzip
RUN curl -s "https://get.sdkman.io" | bash
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh \
&& sdk install java 18.0.2-open \
&& sdk install maven 3.8.6 \
&& sdk install gradle 7.5.1"

# Rust
RUN apt install -y curl
RUN curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# PostgreSQL 14.4
RUN apt install -y postgresql

# Final step: run command prompt
CMD bash
