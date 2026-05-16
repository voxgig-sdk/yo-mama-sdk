package voxgigyomamasdk

import (
	"github.com/voxgig-sdk/yo-mama-sdk/core"
	"github.com/voxgig-sdk/yo-mama-sdk/entity"
	"github.com/voxgig-sdk/yo-mama-sdk/feature"
	_ "github.com/voxgig-sdk/yo-mama-sdk/utility"
)

// Type aliases preserve external API.
type YoMamaSDK = core.YoMamaSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type YoMamaEntity = core.YoMamaEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type YoMamaError = core.YoMamaError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewCategoryEntityFunc = func(client *core.YoMamaSDK, entopts map[string]any) core.YoMamaEntity {
		return entity.NewCategoryEntity(client, entopts)
	}
	core.NewGetRandomJokeEntityFunc = func(client *core.YoMamaSDK, entopts map[string]any) core.YoMamaEntity {
		return entity.NewGetRandomJokeEntity(client, entopts)
	}
	core.NewJokeEntityFunc = func(client *core.YoMamaSDK, entopts map[string]any) core.YoMamaEntity {
		return entity.NewJokeEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewYoMamaSDK = core.NewYoMamaSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
