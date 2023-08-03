#!/bin/sh


view () {
    view=$(echo "$1" | jq -r '.view')
    >&2 echo "Run view: ${view}"
    source "src/views/${view}.sh"
}

listener () {
  >&2 echo "Run listener"
}

resource () {
  >&2 echo "Send resource"
}

manifest () {
  >&2 echo "Send manifest"
}

STD_IN=$(</dev/stdin)

request="$STD_IN"

>&2 echo "Request: ${request}"

if [ "$(echo "${request}" | jq '.view!=null')" == "true" ]; then
    view "$request"
elif [ "$(echo "${request}" | jq '.listener!=null')" == "true" ]; then
    listener "$request"
elif [ "$(echo "${request}" | jq '.resource!=null')" == "true" ]; then
    resource "$request"
else
    manifest
fi

