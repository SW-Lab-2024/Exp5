#!/bin/bash

IMAGE_NAME="notes"
DOCKERFILE_PATH="."
TAG="latest"

echo "Building Docker image '$IMAGE_NAME:$TAG' from '$DOCKERFILE_PATH/Dockerfile'..."

docker build -t "$IMAGE_NAME:$TAG" "$DOCKERFILE_PATH"

if [ $? -eq 0 ]; then
    echo "Docker image '$IMAGE_NAME:$TAG' built successfully."
else
    echo "Error: Docker image build failed."
    exit 1
fi
