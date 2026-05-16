package = "voxgig-sdk-yo-mama"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/yo-mama-sdk.git"
}
description = {
  summary = "YoMama SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["yo-mama_sdk"] = "yo-mama_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
