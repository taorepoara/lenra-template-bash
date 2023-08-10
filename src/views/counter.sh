counter=$(echo "$data" | jq -r '.[0]')
count=$(echo "$counter" | jq -r '.count')
text=$(echo "$props" | jq -r '.text')
message="$text: $count"

echo '{
    "type": "flex",
    "children": [
        {
            "type": "text",
            "value": "'"$message"'",
        },
        {
            "type": "button",
            "text": "+",
            "onPressed": {
                "action": "increment",
                "props": {
                    "id": 0
                }
            }
        }
    ],
    "spacing": 16,
    "mainAxisAlignment": "spaceEvenly",
    "crossAxisAlignment": "center"
}'