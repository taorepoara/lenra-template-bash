counter=$(echo "$data" | jq -r '.[0]')
id=$(echo "$counter" | jq -r '._id')
count=$(echo "$counter" | jq -r '.count')
text=$(echo "$props" | jq -r '.text')
message="$text: $count"

echo '{
    "type": "flex",
    "children": [
        {
            "type": "text",
            "value": "'"$message"'"
        },
        {
            "type": "button",
            "text": "+",
            "onPressed": {
                "action": "increment",
                "props": {
                    "id": "'"$id"'"
                }
            }
        }
    ],
    "spacing": 16,
    "mainAxisAlignment": "spaceEvenly",
    "crossAxisAlignment": "center"
}'