# YoMama SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

YoMamaUtility.registrar = ->(u) {
  u.clean = YoMamaUtilities::Clean
  u.done = YoMamaUtilities::Done
  u.make_error = YoMamaUtilities::MakeError
  u.feature_add = YoMamaUtilities::FeatureAdd
  u.feature_hook = YoMamaUtilities::FeatureHook
  u.feature_init = YoMamaUtilities::FeatureInit
  u.fetcher = YoMamaUtilities::Fetcher
  u.make_fetch_def = YoMamaUtilities::MakeFetchDef
  u.make_context = YoMamaUtilities::MakeContext
  u.make_options = YoMamaUtilities::MakeOptions
  u.make_request = YoMamaUtilities::MakeRequest
  u.make_response = YoMamaUtilities::MakeResponse
  u.make_result = YoMamaUtilities::MakeResult
  u.make_point = YoMamaUtilities::MakePoint
  u.make_spec = YoMamaUtilities::MakeSpec
  u.make_url = YoMamaUtilities::MakeUrl
  u.param = YoMamaUtilities::Param
  u.prepare_auth = YoMamaUtilities::PrepareAuth
  u.prepare_body = YoMamaUtilities::PrepareBody
  u.prepare_headers = YoMamaUtilities::PrepareHeaders
  u.prepare_method = YoMamaUtilities::PrepareMethod
  u.prepare_params = YoMamaUtilities::PrepareParams
  u.prepare_path = YoMamaUtilities::PreparePath
  u.prepare_query = YoMamaUtilities::PrepareQuery
  u.graphql_body = YoMamaUtilities::GraphqlBody
  u.graphql_errors = YoMamaUtilities::GraphqlErrors
  u.result_basic = YoMamaUtilities::ResultBasic
  u.result_body = YoMamaUtilities::ResultBody
  u.result_headers = YoMamaUtilities::ResultHeaders
  u.transform_request = YoMamaUtilities::TransformRequest
  u.transform_response = YoMamaUtilities::TransformResponse
}
