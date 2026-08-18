# YoMama SDK configuration

module YoMamaConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "YoMama",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://api.yomomma.info",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "category" => {},
          "get_random_joke" => {},
          "joke" => {},
        },
      },
      "entity" => {
        "category" => {
          "fields" => [
            {
              "name" => "categories",
              "type" => "`$ARRAY`",
            },
          ],
          "name" => "category",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/categories",
                  "parts" => [
                    "categories",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.categories`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "get_random_joke" => {
          "fields" => [
            {
              "name" => "joke",
              "req" => true,
              "type" => "`$STRING`",
            },
          ],
          "name" => "get_random_joke",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/",
                  "parts" => [],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "joke" => {
          "fields" => [
            {
              "name" => "joke",
              "req" => true,
              "type" => "`$STRING`",
            },
          ],
          "name" => "joke",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "type",
                        "orig" => "type",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/jokes",
                  "parts" => [
                    "jokes",
                  ],
                  "select" => {
                    "exist" => [
                      "type",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    YoMamaFeatures.make_feature(name)
  end
end
