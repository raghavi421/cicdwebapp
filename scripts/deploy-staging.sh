#!/bin/bash

echo "Deploying to Staging..."

docker compose pull
docker compose down
docker compose up -d

echo "Waiting for services..."
sleep 10

curl http://localhost:5000/health
