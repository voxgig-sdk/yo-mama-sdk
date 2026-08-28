// Typed models for the YoMama SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Category {
  categories?: any[]
}

export interface CategoryListMatch {
  categories?: any[]
}

export interface GetRandomJoke {
  joke: string
}

export interface GetRandomJokeLoadMatch {
  joke?: string
}

export interface Joke {
  joke: string
}

export interface JokeListMatch {
  type?: string
}

