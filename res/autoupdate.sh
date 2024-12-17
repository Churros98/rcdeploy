#!/bin/bash

if [ "$(cat /sys/class/net/wlan0/operstate)" != "up" ]; then
  echo "wlan0 is not up, skipping update"
  exit 0
fi

echo "Stopping containers..."
docker compose -f /opt/docker-compose.yaml down
echo "Pruning containers..."
docker container prune -f
echo "Pulling images..."
docker compose -f /opt/docker-compose.yaml pull
echo "Starting containers..."
docker compose -f /opt/docker-compose.yaml up -d
echo "Done"
