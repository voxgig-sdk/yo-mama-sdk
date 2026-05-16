package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewCategoryEntityFunc func(client *YoMamaSDK, entopts map[string]any) YoMamaEntity

var NewGetRandomJokeEntityFunc func(client *YoMamaSDK, entopts map[string]any) YoMamaEntity

var NewJokeEntityFunc func(client *YoMamaSDK, entopts map[string]any) YoMamaEntity

