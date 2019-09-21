# FROM alpine:3.10.2
#
# RUN mkdir /app
# WORKDIR /app
# COPY agent agent/
#
# CMD ["/app/agent/agent"]

FROM golang:1.13 as build-env

WORKDIR /go/src/app
ADD ./agent/ /go/src/app

RUN go get -d -v ./...

RUN go build -o /go/bin/app

FROM gcr.io/distroless/base
COPY --from=build-env /go/bin/app /
CMD ["/app"]
