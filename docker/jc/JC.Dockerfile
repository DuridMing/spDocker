
FROM openjdk:8-jdk-alpine as jdk
WORKDIR /

FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
MAINTAINER Ming

RUN apt-get update
RUN apt-get -y upgrade 

RUN apt-get install -y build-essential 

ARG PYTHON=python3.7

RUN apt-get install --no-install-recommends -y -q curl wget

COPY --from=jdk j

RUN javac -version