FROM golang:1.8

ENV GOPATH=/go

WORKDIR /go/src/app

ADD . /go/src/app/

EXPOSE 8090

CMD [ "./entrypoint.sh"]