# YoMama SDK exists test

require "minitest/autorun"
require_relative "../YoMama_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = YoMamaSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
