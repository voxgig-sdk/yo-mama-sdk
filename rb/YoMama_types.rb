# frozen_string_literal: true

# Typed models for the YoMama SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Category entity data model.
#
# @!attribute [rw] category
#   @return [Array, nil]
Category = Struct.new(
  :category,
  keyword_init: true
)

# Match filter for Category#list (any subset of Category fields).
#
# @!attribute [rw] category
#   @return [Array, nil]
CategoryListMatch = Struct.new(
  :category,
  keyword_init: true
)

# GetRandomJoke entity data model.
#
# @!attribute [rw] joke
#   @return [String]
GetRandomJoke = Struct.new(
  :joke,
  keyword_init: true
)

# Match filter for GetRandomJoke#load (any subset of GetRandomJoke fields).
#
# @!attribute [rw] joke
#   @return [String, nil]
GetRandomJokeLoadMatch = Struct.new(
  :joke,
  keyword_init: true
)

# Joke entity data model.
#
# @!attribute [rw] joke
#   @return [String]
Joke = Struct.new(
  :joke,
  keyword_init: true
)

# Match filter for Joke#list (any subset of Joke fields).
#
# @!attribute [rw] joke
#   @return [String, nil]
JokeListMatch = Struct.new(
  :joke,
  keyword_init: true
)

