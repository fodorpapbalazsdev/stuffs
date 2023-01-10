#!/bin/bash

namespace="$1"
original_context=$(kubectx -c)
original_namespace=$(kubens -c)
found='0'

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;36m'
PLAIN='\033[0m'
bold=$(tput bold)
normal=$(tput sgr0)

cluster_objects() {
	for cluster in $(kubectx)
	do
      echo "${BLUE}"Cluster: $cluster
      kubectx $cluster
      for namespace in $(kubens)
      do
         echo "${GREEN}" $namespace
      done
	done
}

namespace_search() {
	for cluster in $(kubectx)
	do
      kubectx $cluster
      for namespace in $(kubens)
      do
         #if [[ "$namespace" =~ "$1" ]]; then
         if [[ $(fgrep -ix $namespace <<< $1) ]]; then
           found=$cluster
           echo "${BLUE}--> Found it under cluster: ${YELLOW}$cluster${GREEN}"
           if [ -z "$2" ]
             then
                echo "${BLUE}--> Run the following cmd to switch to it: ${YELLOW}kubectx '$cluster' && kubens '$namespace'${GREEN}"
           else
              echo "${BLUE}--> Lets switch to ${YELLOW}$cluster : $namespace${GREEN}"
              kubectx $cluster && kubens $namespace
              if [ "$2" = 'kafka' ]; then
                echo "${BLUE}--> Get ssh in kafka-0:${PLAIN}"
                kubectl exec --stdin --tty kafka-0 -- /bin/bash
              fi
           fi
           break
         fi
      done
      if [[ "$found" != '0' ]]; then
        break
      fi

	done
}

reset() {
   echo "${BLUE}Reset context and namespace to ${YELLOW}$original_context : $original_namespace${GREEN}"
   kubectx $original_context
   kubens  $original_namespace
}

clear
# if the first argument is given, then wee look for that namespace
if [ -z "$1" ]; then
   echo "${BLUE}No argument supplied, running in default mode [listing all of the clusters and namespaces]${GREEN}"
   cluster_objects
else
   echo "${BLUE}Looking for: ${YELLOW}$1${GREEN}"
   namespace_search $1 $2
fi

# if we have second argument, then we want to connect to that cluster:namespace, so we do not want to reset
if [ -z "$2" ]
 then
    reset
fi