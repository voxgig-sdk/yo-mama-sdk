# YoMama SDK utility: make_context
require_relative '../core/context'
module YoMamaUtilities
  MakeContext = ->(ctxmap, basectx) {
    YoMamaContext.new(ctxmap, basectx)
  }
end
