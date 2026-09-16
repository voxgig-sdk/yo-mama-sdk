# YoMama SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module YoMamaFeatures
  def self.make_feature(name)
    case name
    when "base"
      YoMamaBaseFeature.new
    when "ratelimit"
      YoMamaRatelimitFeature.new
    when "retry"
      YoMamaRetryFeature.new
    when "test"
      YoMamaTestFeature.new
    when "timeout"
      YoMamaTimeoutFeature.new
    else
      YoMamaBaseFeature.new
    end
  end
end
