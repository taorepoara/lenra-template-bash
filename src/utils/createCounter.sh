token=$(echo "$api" | jq -r '.token')
url=$(echo "$api" | jq -r '.url')
coll="counter"

counters=$(curl -X POST -H "Authorization: Bearer ${token}" -H "Content-Type: application/json" -d '{"user": "'"${user}"'"}' "${url}/app/colls/${coll}/docs/find")

>&2 echo "counters: ${counters}"

if [ "$(echo "${counters}" | jq '.[0]')" == "null" ]; then
    >&2 echo "Create counter"
    curl -X POST -H "Authorization: Bearer ${token}" -H "Content-Type: application/json" -d '{
            "count": 0,
            "user": "'"${user}"'"
        }' "${url}/app/colls/${coll}/docs"
fi