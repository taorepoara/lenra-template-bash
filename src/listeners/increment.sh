token=$(echo "$api" | jq -r '.token')
url=$(echo "$api" | jq -r '.url')
coll="counter"

id=$(echo "$props" | jq -r '.id')

counter=$(curl -H "Authorization: Bearer ${token}" "${url}/app/colls/${coll}/docs/${id}")
count=$(echo "$counter" | jq -r '.count')

counter=$(echo "$counter" | jq -r '.count='$(($count+1)))

curl -X PUT -H "Authorization: Bearer ${token}" -H "Content-Type: application/json" -d "${counter}" "${url}/app/colls/${coll}/docs/${id}"