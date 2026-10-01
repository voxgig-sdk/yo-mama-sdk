"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const node_test_1 = require("node:test");
const __1 = require("..");
const definition_runner_1 = require("./definition-runner");
const utility_1 = require("./utility");
// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN = [
    {
        "entity": "category",
        "accessor": "Category",
        "op": "list",
        "method": "GET",
        "path": "/categories",
        "args": [],
        "select": {},
        "headers": [],
        "query": [],
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
        "query": [],
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
        "query": [
            "type"
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
];
(0, node_test_1.describe)('definition', () => {
    for (const point of PLAN) {
        (0, node_test_1.test)(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
            const control = (0, utility_1.isControlSkipped)('entityOp', point.entity + '.' + point.op, 'definition');
            if (control.skip) {
                t.skip(control.reason || 'skipped via sdk-test-control.json');
                return;
            }
            await (0, definition_runner_1.runDefinitionPoint)(__1.SDK, point);
        });
    }
});
//# sourceMappingURL=definition.test.js.map