-- YoMama SDK exists test

local sdk = require("yo-mama_sdk")

describe("YoMamaSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
