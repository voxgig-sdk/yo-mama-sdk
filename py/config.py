# YoMama SDK configuration


def make_config():
    return {
        "main": {
            "name": "YoMama",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://api.yomomma.info",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "category": {},
                "get_random_joke": {},
                "joke": {},
            },
        },
        "entity": {
      "category": {
        "fields": [
          {
            "active": True,
            "name": "category",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 0,
          },
        ],
        "name": "category",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {},
                "method": "GET",
                "orig": "/categories",
                "parts": [
                  "categories",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "get_random_joke": {
        "fields": [
          {
            "active": True,
            "name": "joke",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
        ],
        "name": "get_random_joke",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {},
                "method": "GET",
                "orig": "/",
                "parts": [],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "joke": {
        "fields": [
          {
            "active": True,
            "name": "joke",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
        ],
        "name": "joke",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "type",
                      "orig": "type",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "method": "GET",
                "orig": "/jokes",
                "parts": [
                  "jokes",
                ],
                "select": {
                  "exist": [
                    "type",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
