# YoMama SDK utility: feature_add
module YoMamaUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
