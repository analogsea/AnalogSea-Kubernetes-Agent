FROM alpine:3.10.2

RUN mkdir /app
WORKDIR /app
COPY agent agent/

CMD ["/app/agent/agent"]
