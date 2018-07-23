FROM golang:1.9

ENV GOPATH=/go

WORKDIR /go/src/app

ADD . /go/src/app/

# EXPOSE 8090

RUN ls

RUN pwd

# RUN chmod +x setup.sh

# RUN ./setup.sh

# RUN npm install newman --global

CMD [ "./entrypoint.sh"]
