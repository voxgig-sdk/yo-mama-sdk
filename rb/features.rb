# YoMama SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module YoMamaFeatures
  def self.make_feature(name)
    case name
    when "base"
      YoMamaBaseFeature.new
    when "test"
      YoMamaTestFeature.new
    else
      YoMamaBaseFeature.new
    end
  end
end
