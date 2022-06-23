#!/bin/bash

echo "--> start kafka"

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
    echo "ERROR: Docker does not seem to be running, run it first and retry"
    exit 1
else

   if ! { test -f "$path"/zookeeper.yaml && test -f "$path"/kafka.yaml; } then
        echo "ERROR: Kafka yaml config files (zookeeper.yaml or kafka.yaml) don't found under '$path'"
        echo "INFO: Please provide the correct path with -p like 'start.sh $HOME/Documents/kafka/kafka-docker'"
        exit 1
   else
        kubectl config use-context docker-desktop
        kubectl create namespace zookeeper
        kubectl -n zookeeper apply -f "$path"/zookeeper.yaml
        kubectl create namespace kafka
        kubectl -n kafka apply -f "$path"/kafka.yaml
        echo "--> Successful"
   fi
fi