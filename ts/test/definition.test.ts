import { describe, test } from 'node:test'
import { SDK } from '..'
import { runDefinitionPoint } from './definition-runner'
import { isControlSkipped } from './utility'


// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN: any[] = [
  {
    "entity": "category",
    "accessor": "Category",
    "op": "list",
    "method": "GET",
    "path": "/categories",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": null,
    "status": 200,
    "sample": {
      "categories": [
        "fat",
        "stupid",
        "ugly"
      ]
    },
    "idField": "id"
  },
  {
    "entity": "get_random_joke",
    "accessor": "GetRandomJoke",
    "op": "load",
    "method": "GET",
    "path": "/",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": null,
    "status": 200,
    "sample": {
      "joke": "Yo mama is so fat, when she skips a meal, the stock market drops."
    },
    "idField": "id"
  },
  {
    "entity": "joke",
    "accessor": "Joke",
    "op": "list",
    "method": "GET",
    "path": "/jokes",
    "args": [],
    "select": {
      "type": "v1"
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "type"
    ],
    "queryArgs": [
      {
        "name": "type",
        "wire": "type"
      }
    ],
    "auth": null,
    "status": 200,
    "sample": [
      {
        "joke": "Yo mama is so fat, when she skips a meal, the stock market drops."
      },
      {
        "joke": "Yo mama is so fat, she has her own zip code."
      }
    ],
    "idField": "id"
  }
]


describe('definition', () => {
  for (const point of PLAN) {
    test(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
      const control = isControlSkipped('entityOp', point.entity + '.' + point.op, 'definition')
      if (control.skip) {
        t.skip(control.reason || 'skipped via sdk-test-control.json')
        return
      }
      await runDefinitionPoint(SDK, point)
    })
  }
})
