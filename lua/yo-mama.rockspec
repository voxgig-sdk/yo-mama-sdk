package = "voxgig-sdk-yo-mama"
version = "0.0.1-1"
source = {
  -- git+https (GitHub dropped git:// in 2022); pin the install to the release
  -- tag pushed by `make publish`, and point at the lua/ subdir of the monorepo.
  url = "git+https://github.com/voxgig-sdk/yo-mama-sdk.git",
  tag = "lua/v0.0.1",
  dir = "yo-mama-sdk/lua"
}
description = {
  summary = "Unofficial generated Lua SDK for the Yo Mama public API. Not affiliated with or endorsed by the upstream API provider.",
  homepage = "https://github.com/voxgig-sdk/yo-mama-sdk",
  issues_url = "https://github.com/voxgig-sdk/yo-mama-sdk/issues",
  license = "MIT",
  labels = { "voxgig", "sdk", "generated-sdk", "openapi", "api-client", "yo-mama" }
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["yo-mama_sdk"] = "yo-mama_sdk.lua",
    ["config"] = "config.lua",
    ["config_shared"] = "config_shared.lua",
    ["features"] = "features.lua",
  }
}
