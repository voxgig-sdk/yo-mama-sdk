package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewRatelimitFeatureFunc func() Feature

var NewRetryFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewTimeoutFeatureFunc func() Feature

var NewCategoryEntityFunc func(client *YoMamaSDK, entopts map[string]any) YoMamaEntity

var NewGetRandomJokeEntityFunc func(client *YoMamaSDK, entopts map[string]any) YoMamaEntity

var NewJokeEntityFunc func(client *YoMamaSDK, entopts map[string]any) YoMamaEntity

