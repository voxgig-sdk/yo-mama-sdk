<?php
declare(strict_types=1);

// Typed models for the YoMama SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Category entity data model. */
class Category
{
    public ?array $category = null;
}

/** Match filter for Category#list (any subset of Category fields). */
class CategoryListMatch
{
    public ?array $category = null;
}

/** GetRandomJoke entity data model. */
class GetRandomJoke
{
    public string $joke;
}

/** Match filter for GetRandomJoke#load (any subset of GetRandomJoke fields). */
class GetRandomJokeLoadMatch
{
    public ?string $joke = null;
}

/** Joke entity data model. */
class Joke
{
    public string $joke;
}

/** Match filter for Joke#list (any subset of Joke fields). */
class JokeListMatch
{
    public ?string $joke = null;
}

