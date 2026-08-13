# YoMama SDK exists test

import pytest
from yomama_sdk import YoMamaSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = YoMamaSDK.test(None, None)
        assert testsdk is not None
