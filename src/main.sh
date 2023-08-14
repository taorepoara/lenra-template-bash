#!/bin/bash


view () {
    view=$(echo "$1" | jq -r '.view')
    >&2 echo "Run view: ${view}"
    data=$(echo "$1" | jq -r '.data')
    props=$(echo "$1" | jq -r '.props')
    request="$1"
    source "src/views/${view}.sh"
}

listener () {
  listener=$(echo "$1" | jq -r '.action')
  props=$(echo "$1" | jq -r '.props')
  event=$(echo "$1" | jq -r '.event')
  api=$(echo "$1" | jq -r '.api')
  >&2 echo "Run listener: ${listener}"
  source "src/listeners/${listener}.sh"
}

resource () {
  >&2 echo "Send resource"
}

manifest () {
  >&2 echo "Send manifest"
  source "src/manifest.sh"
}

STD_IN=$(</dev/stdin)

request="$STD_IN"

# >&2 echo "Request: ${request}"

if [ "$(echo "${request}" | jq '.view!=null')" == "true" ]; then
    view "$request"
elif [ "$(echo "${request}" | jq '.action!=null')" == "true" ]; then
    listener "$request"
elif [ "$(echo "${request}" | jq '.resource!=null')" == "true" ]; then
    resource "$request"
else
    manifest
fi

