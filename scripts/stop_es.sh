#!/bin/bash

OLD_PID=$(ps -ef |grep "\borg.elasticsearch.bootstrap.Elasticsearch\b" |awk '{print $2}')
if [[ ! -z "$OLD_PID" ]]; then
  #Kill ES if already running
  echo "Stopping ES with PID = $OLD_PID"
  kill $OLD_PID
  sleep 1s
  while [[ ! -z "$OLD_PID" ]]
  do
    OLD_PID=$(ps -ef |grep "\borg.elasticsearch.bootstrap.Elasticsearch\b" |awk '{print $2}')
  done

  echo "Stopped ES successfully"
else
  echo "ES is not running"
fi

