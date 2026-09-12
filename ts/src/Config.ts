
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS: Record<string, any[]> = {
  
}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'YoMama',
        slug: "yo-mama",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     test:     {
      "options": {
        "active": false
      },
      "transport": "base"
    },

  }


  options = {
    base: "https://api.yomomma.info",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      category: {
      },

      get_random_joke: {
      },

      joke: {
      },

    }
  }


  entity = {
    "category": {
      "fields": [
        {
          "name": "categories",
          "type": "`$ARRAY`"
        }
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
              "segments": [
                {
                  "lit": "categories"
                }
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body.categories`"
              },
              "parts": [
                "categories"
              ]
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "get_random_joke": {
      "fields": [
        {
          "name": "joke",
          "req": true,
          "short": "The joke text",
          "type": "`$STRING`"
        }
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
              "segments": [],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "parts": []
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "joke": {
      "fields": [
        {
          "name": "joke",
          "req": true,
          "short": "The joke text",
          "type": "`$STRING`"
        }
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
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/jokes",
              "segments": [
                {
                  "lit": "jokes"
                }
              ],
              "select": {
                "exist": [
                  "type"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "parts": [
                "jokes"
              ]
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config,
  FEATURE_PLUGINS,
}

