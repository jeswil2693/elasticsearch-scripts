#!/bin/bash

#Check if ES is already running
OLD_PID=$(ps -ef |grep "\borg.elasticsearch.bootstrap.Elasticsearch\b" |awk '{print $2}')
if [ -z "$OLD_PID" ]; then

  #Cleanup old logs
  rm -rf es_run_log.log

  #Starting ES and redirecting logs
  nohup elasticsearch > es_run_log.log 2>&1 &

  echo "Starting ES locally"

  while [ -z "$PID" ]
  do
    PID=$(ps -ef |grep "\borg.elasticsearch.bootstrap.Elasticsearch\b" |awk '{print $2}')
  done

  echo "Started ES with PID = $PID"
else
  echo "ES is already running on PID = $OLD_PID"
fi
