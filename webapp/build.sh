#!/bin/bash

COMMIT_HASH=$(git rev-parse --short HEAD)

APP_NAME="server"
IMAGE_NAME="webapp"

go build -ldflags "-X main.commitHash=$COMMIT_HASH" -o $APP_NAME .

docker build -t $IMAGE_NAME --build-arg COMMIT_HASH=$COMMIT_HASH .

