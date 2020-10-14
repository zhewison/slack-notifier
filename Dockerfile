FROM golang:1.13.3-buster as builder
ENV GO111MODULE=on
ENV CGO_ENABLED=0
WORKDIR /usr/src/
COPY . /usr/src
RUN go build -v -o "bin/slack-notifier" *.go
RUN mv bin/slack-notifier /usr/local/bin

RUN apt-get update && apt-get install -y curl jq