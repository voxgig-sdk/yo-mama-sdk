# GetRandomJoke entity test

require "minitest/autorun"
require "json"
require_relative "../YoMama_sdk"
require_relative "runner"

class GetRandomJokeEntityTest < Minitest::Test
  def test_create_instance
    testsdk = YoMamaSDK.test(nil, nil)
    ent = testsdk.GetRandomJoke(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = get_random_joke_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "get_random_joke." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set YOMAMA_TEST_GET_RANDOM_JOKE_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    get_random_joke_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.get_random_joke")))
    get_random_joke_ref01_data = nil
    if get_random_joke_ref01_data_raw.length > 0
      get_random_joke_ref01_data = Helpers.to_map(get_random_joke_ref01_data_raw[0][1])
    end

    # LOAD
    get_random_joke_ref01_ent = client.GetRandomJoke(nil)
    get_random_joke_ref01_match_dt0 = {}
    get_random_joke_ref01_data_dt0_loaded, err = get_random_joke_ref01_ent.load(get_random_joke_ref01_match_dt0, nil)
    assert_nil err
    assert !get_random_joke_ref01_data_dt0_loaded.nil?

  end
end

def get_random_joke_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "get_random_joke", "GetRandomJokeTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = YoMamaSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["get_random_joke01", "get_random_joke02", "get_random_joke03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["YOMAMA_TEST_GET_RANDOM_JOKE_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "YOMAMA_TEST_GET_RANDOM_JOKE_ENTID" => idmap,
    "YOMAMA_TEST_LIVE" => "FALSE",
    "YOMAMA_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["YOMAMA_TEST_GET_RANDOM_JOKE_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["YOMAMA_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
      },
      extra || {},
    ])
    client = YoMamaSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["YOMAMA_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["YOMAMA_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
