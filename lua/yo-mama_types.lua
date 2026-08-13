-- Typed models for the YoMama SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Category
---@field categories? table

---@class CategoryListMatch
---@field categories? table

---@class GetRandomJoke
---@field joke string

---@class GetRandomJokeLoadMatch
---@field joke? string

---@class Joke
---@field joke string

---@class JokeListMatch
---@field joke? string

local M = {}

return M
