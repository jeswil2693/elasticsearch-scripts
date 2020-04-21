#!/bin/bash

PID=$(ps -ef |grep "\borg.elasticsearch.bootstrap.Elasticsearch\b" |awk '{print $2}')

if [ -z "$PID" ]; then
  echo "ES is not running"
else
  echo "ES running with PID = $PID"
fi

