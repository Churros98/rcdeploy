#!/bin/bash
DB_URL=""
DB_USERNAME=""
DB_PASSWORD=""
UUID=""

while true; do
  export HOST=$(dig +short video.theorywrong.me)
  DIG_EXIT_CODE=$?

  if [ $DIG_EXIT_CODE -ne 0 ]; then
    echo "DNS resolution failed, waiting 5 seconds before retrying"
    sleep 5
    continue
  fi

  break
done

/usr/local/bin/rctelemetrie $UUID $DB_URL $DB_USERNAME $DB_PASSWORD