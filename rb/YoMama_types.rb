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
# @!attribute [rw] categories
#   @return [Array, nil]
Category = Struct.new(
  :categories,
  keyword_init: true
)

# Request payload for Category#list.
#
# @!attribute [rw] categories
#   @return [Array, nil]
CategoryListMatch = Struct.new(
  :categories,
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

# Request payload for GetRandomJoke#load.
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

# Request payload for Joke#list.
#
# @!attribute [rw] type
#   @return [String, nil]
JokeListMatch = Struct.new(
  :type,
  keyword_init: true
)

