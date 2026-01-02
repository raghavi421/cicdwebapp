#!/bin/bash
set -e

echo "Deploying to Staging..."

docker compose -f docker-compose.staging.yml pull
docker compose -f docker-compose.staging.yml down
docker compose -f docker-compose.staging.yml up -d

echo "Waiting for services..."
sleep 10

curl http://localhost:5001/health
