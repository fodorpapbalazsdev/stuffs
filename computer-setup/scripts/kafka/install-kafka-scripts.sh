#!/bin/bash

MY_DIR="$(dirname "$(readlink -f "$0")")"

if [ -z "$1" ]
then
  echo "ERROR: Please provide the path of the kafka directory";
  echo "       like: 'sh kafka/install-kafka-scripts.sh $HOME/Documents/kafka/kafka-docker'";
  exit 1;
fi

declare KAFKA_DIR="$1";

if ! [[ -d "$KAFKA_DIR" ]]
then
    echo "$KAFKA_DIR does not exists on your filesystem."
    exit 1
fi


if ! { test -f "$MY_DIR"/start.sh && test -f "$MY_DIR"/stop.sh; } then
        echo "ERROR: start.sh and stop.sh don't found under '$MY_DIR'"
        exit 1
fi

echo "--> copying scripts (start.sh and stop.sh) into '$KAFKA_DIR'"
cp "$MY_DIR"/start.sh "$KAFKA_DIR"
cp "$MY_DIR"/stop.sh "$KAFKA_DIR"
echo "--> Successful"
