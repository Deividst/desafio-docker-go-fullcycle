FROM golang:1.21 AS build

WORKDIR /app

RUN go mod init feedme \
    && go mod tidy

COPY helloWorld.go ./

RUN go build -o /server

FROM scratch

WORKDIR /

COPY --from=build /server /server

ENTRYPOINT ["/server"]