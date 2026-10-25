# YoMama SDK utility: prepare_body
require_relative 'media'
module YoMamaUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return YoMamaUtilities.raw_body(ctx.reqdata) if YoMamaUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
