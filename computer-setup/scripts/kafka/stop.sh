#!/bin/bash

echo "--> stop kafka"

MY_DIR="$(dirname "$(readlink -f "$0")")"

path="$MY_DIR"

while getopts "p:" opt; do
  case $opt in
    p) path="$OPTARG"
       echo "--> cd into '$path'"
       cd "$path" || exit
    ;;
    \?) echo "ERROR: Invalid option -$OPTARG" >&2
        exit 1
    ;;
  esac
done

if ! docker info >/dev/null 2>&1; then
    echo "INFO: Docker does not seem to be running, nothing to stop."
    echo "--> Successful"
else

   if ! { test -f "$path"/zookeeper.yaml && test -f "$path"/kafka.yaml; } then
        echo "ERROR: Kafka yaml config files (zookeeper.yaml or kafka.yaml) don't found under '$path'"
        echo "INFO: Please provide the correct path with -p like 'stop.sh $HOME/Documents/kafka/kafka-docker'"
        exit 1
   else
        kubectl config use-context docker-desktop
        kubectl -n kafka delete -f "$path"/kafka.yaml
        kubectl -n zookeeper delete -f "$path"/zookeeper.yaml
        kubectl delete namespace kafka
        kubectl delete namespace zookeeper
        echo "--> Successful"
   fi
fi