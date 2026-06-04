# YoMama SDK

Fetch random Yo Mama jokes as JSON, with optional category filtering

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Yo Mama API

The [Yo Mama API](https://api.yomomma.info) is a small free service that returns Yo Mama jokes as JSON. There is no published maintainer information or formal documentation; the most useful third-party reference is the [Free Public APIs catalogue page](https://freepublicapis.com/yo-mama-api).

What you get from the API:

- A random Yo Mama joke from the full corpus
- A random joke restricted to a specific category (e.g. `fat`)
- A listing of jokes grouped by category

No API key, OAuth, or sign-up is required. Rate limits are not documented. CORS is reported as disabled on all endpoints, so client-side use from a browser may require a server-side proxy.

## Try it

**TypeScript**
```bash
npm install yo-mama
```

**Python**
```bash
pip install yo-mama-sdk
```

**PHP**
```bash
composer require voxgig/yo-mama-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/yo-mama-sdk/go
```

**Ruby**
```bash
gem install yo-mama-sdk
```

**Lua**
```bash
luarocks install yo-mama-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { YoMamaSDK } from 'yo-mama'

const client = new YoMamaSDK({})

// List all categorys
const categorys = await client.Category().list()
```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o yo-mama-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "yo-mama": {
      "command": "/abs/path/to/yo-mama-mcp"
    }
  }
}
```

## Entities

The API exposes 3 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **Category** | A named grouping of Yo Mama jokes (for example `fat`) used to scope listing and random-joke requests. | `/categories` |
| **GetRandomJoke** | Operation that returns a single randomly selected joke from the corpus via `GET /api/random`. | `/` |
| **Joke** | A single Yo Mama joke resource returned as JSON, either at random or as part of a category listing. | `/jokes` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from yomama_sdk import YoMamaSDK

client = YoMamaSDK({})

# List all categorys
categorys, err = client.Category(None).list(None, None)
```

### PHP

```php
<?php
require_once 'yomama_sdk.php';

$client = new YoMamaSDK([]);

// List all categorys
[$categorys, $err] = $client->Category(null)->list(null, null);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/yo-mama-sdk/go"

client := sdk.NewYoMamaSDK(map[string]any{})

// List all categorys
categorys, err := client.Category(nil).List(nil, nil)
```

### Ruby

```ruby
require_relative "YoMama_sdk"

client = YoMamaSDK.new({})

# List all categorys
categorys, err = client.Category(nil).list(nil, nil)
```

### Lua

```lua
local sdk = require("yo-mama_sdk")

local client = sdk.new({})

-- List all categorys
local categorys, err = client:Category(nil):list(nil, nil)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = YoMamaSDK.test()
const result = await client.Category().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = YoMamaSDK.test(None, None)
result, err = client.Category(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = YoMamaSDK::test(null, null);
[$result, $err] = $client->Category(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Category(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = YoMamaSDK.test(nil, nil)
result, err = client.Category(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Category(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Yo Mama API

- Upstream: [https://api.yomomma.info](https://api.yomomma.info)
- API docs: [https://freepublicapis.com/yo-mama-api](https://freepublicapis.com/yo-mama-api)

- No licence or terms of use are published for the joke corpus
- No authentication or API key is required
- No attribution requirements are documented
- CORS is reportedly disabled, so browser-side calls may need a proxy

---

Generated from the Yo Mama API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
