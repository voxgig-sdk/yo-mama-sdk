# Typed models for the YoMama SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Category:
    category: Optional[list] = None


@dataclass
class CategoryListMatch:
    category: Optional[list] = None


@dataclass
class GetRandomJoke:
    joke: str


@dataclass
class GetRandomJokeLoadMatch:
    joke: Optional[str] = None


@dataclass
class Joke:
    joke: str


@dataclass
class JokeListMatch:
    joke: Optional[str] = None

