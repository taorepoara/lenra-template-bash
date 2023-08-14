echo '{
    "type": "container",
    "child": {
        "type": "flex",
        "children": [
            {
                "type": "container",
                "child": {
                    "type": "image",
                    "src": "logo.png"
                },
                "constraints": {
                    "maxWidth": 32,
                    "minWidth": 32,
                    "maxHeight": 32,
                    "minHeight": 32
                }
            },
            {
                "type": "flexible",
                "child": {
                    "type": "container",
                    "child": {
                        "type": "text",
                        "value": "Hello World",
                        "textAlign": "center",
                        "style": {
                            "fontWeight": "bold",
                            "fontSize": 24
                        }
                    }
                }
            }
        ],
        "fillParent": true,
        "mainAxisAlignment": "spaceBetween",
        "crossAxisAlignment": "center",
        "padding": {
            "right": 32
        }
    },
    "decoration": {
        "color": 4294967295,
        "boxShadow": {
            "blurRadius": 8,
            "color": 436207616,
            "offset": {
                "dx": 0,
                "dy": 1
            }
        }
    },
    "padding": {
        "top": 16,
        "bottom": 16,
        "left": 32,
        "right": 32
    }
}'