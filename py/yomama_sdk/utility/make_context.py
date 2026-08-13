# YoMama SDK utility: make_context

from yomama_sdk.core.context import YoMamaContext


def make_context_util(ctxmap, basectx):
    return YoMamaContext(ctxmap, basectx)
