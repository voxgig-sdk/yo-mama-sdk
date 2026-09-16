# YoMama SDK feature factory

from yomama_sdk.feature.base_feature import YoMamaBaseFeature
from yomama_sdk.feature.ratelimit_feature import YoMamaRatelimitFeature
from yomama_sdk.feature.retry_feature import YoMamaRetryFeature
from yomama_sdk.feature.test_feature import YoMamaTestFeature
from yomama_sdk.feature.timeout_feature import YoMamaTimeoutFeature


_FEATURES = {
    "base": lambda: YoMamaBaseFeature(),
    "ratelimit": lambda: YoMamaRatelimitFeature(),
    "retry": lambda: YoMamaRetryFeature(),
    "test": lambda: YoMamaTestFeature(),
    "timeout": lambda: YoMamaTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
