# YoMama SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
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
            "name": "categories",
            "type": "`$ARRAY`",
          },
        ],
        "name": "category",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/categories",
                "parts": [
                  "categories",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.categories`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "get_random_joke": {
        "fields": [
          {
            "name": "joke",
            "req": True,
            "type": "`$STRING`",
          },
        ],
        "name": "get_random_joke",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/",
                "parts": [],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "joke": {
        "fields": [
          {
            "name": "joke",
            "req": True,
            "type": "`$STRING`",
          },
        ],
        "name": "joke",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "type",
                      "orig": "type",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
