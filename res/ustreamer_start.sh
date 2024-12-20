#!/bin/bash
export UUID=11111111-1111-1111-1111-111111111111

while true; do
  export HOST=$(dig +short video.theorywrong.me)
  DIG_EXIT_CODE=$?

  if [ $DIG_EXIT_CODE -ne 0 ]; then
    echo "DNS resolution failed, waiting 5 seconds before retrying"
    sleep 5
    continue
  fi

  if ! echo "$HOST" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'; then
    echo "IP address is not valid, waiting 5 seconds before retrying"
    sleep 5
    continue
  fi

  break
done

/usr/local/bin/ustreamer -d /dev/video0 -Z --host $HOST --port 1337 -f 25 -c M2M-IMAGE --uuid $UUID
