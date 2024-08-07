#!/bin/bash

IMAGE_NAME="notes"
DOCKERFILE_PATH="."
TAG="latest"

COMPOSE_FILE="docker-compose.yml"

echo "Building Docker image '$IMAGE_NAME:$TAG' from '$DOCKERFILE_PATH/Dockerfile'..."

docker build -t "$IMAGE_NAME:$TAG" "$DOCKERFILE_PATH"

if [ $? -eq 0 ]; then
    echo "Docker image '$IMAGE_NAME:$TAG' built successfully."
else
    echo "Error: Docker image build failed."
    exit 1
fi

echo "Running Docker Compose using file '$COMPOSE_FILE'..."
docker compose -f "$COMPOSE_FILE" up -d

if [ $? -eq 0 ]; then
    echo "Docker Compose ran successfully."
else
    echo "Error: Docker Compose failed."
    exit 1
fi
