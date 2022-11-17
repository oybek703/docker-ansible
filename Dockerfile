FROM golang:alpine as go-build
WORKDIR /opt/go-app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM scratch
WORKDIR /opt/go-app
COPY --from=go-build /opt/go-app/docker-demo-2 ./
ENTRYPOINT ["./docker-demo-2"]
