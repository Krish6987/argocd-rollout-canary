FROM golang:1.12-alpine AS build_base

ENV PORT "8081"
ENV MESSAGE "Hello world!!!"
RUN apk add --no-cache git

# Set the Current Working Directory inside the container
WORKDIR /tmp/go-sample-app

# We want to populate the module cache based on the go.{mod,sum} files.
COPY app/go.mod .

RUN go mod download

COPY app/main.go ./main.go

ENV CGO_ENABLED=0
# Build the Go app
RUN go build -o ./out/go-sample-app .

# Start fresh from a smaller image
FROM alpine:3.9 
RUN apk add ca-certificates

COPY --from=build_base /tmp/go-sample-app/out/go-sample-app /app/go-sample-app

# Run the binary program produced by `go install`
CMD ["app/go-sample-app"]
