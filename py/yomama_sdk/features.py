# YoMama SDK feature factory

from yomama_sdk.feature.base_feature import YoMamaBaseFeature
from yomama_sdk.feature.test_feature import YoMamaTestFeature


def _make_feature(name):
    features = {
        "base": lambda: YoMamaBaseFeature(),
        "test": lambda: YoMamaTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
