-- YoMama SDK error

local YoMamaError = {}
YoMamaError.__index = YoMamaError


function YoMamaError.new(code, msg, ctx)
  local self = setmetatable({}, YoMamaError)
  self.is_sdk_error = true
  self.sdk = "YoMama"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function YoMamaError:error()
  return self.msg
end


function YoMamaError:__tostring()
  return self.msg
end


return YoMamaError
