FROM golang:1.24.2 AS builder

WORKDIR /app
COPY . .

ARG COMMIT_HASH=unknown
ENV CGO_ENABLED=0

RUN go mod tidy && \
    go build -ldflags "-X main.commitHash=$COMMIT_HASH" -o server .

FROM alpine:latest

WORKDIR /root/
COPY --from=builder /app/server .

EXPOSE 8080
CMD ["./server"]
