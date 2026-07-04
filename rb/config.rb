# YoMama SDK configuration

module YoMamaConfig
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
              "active" => true,
              "name" => "category",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 0,
            },
          ],
          "name" => "category",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "method" => "GET",
                  "orig" => "/categories",
                  "parts" => [
                    "categories",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "list",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "get_random_joke" => {
          "fields" => [
            {
              "active" => true,
              "name" => "joke",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 0,
            },
          ],
          "name" => "get_random_joke",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "method" => "GET",
                  "orig" => "/",
                  "parts" => [],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "joke" => {
          "fields" => [
            {
              "active" => true,
              "name" => "joke",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 0,
            },
          ],
          "name" => "joke",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "type",
                        "orig" => "type",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                  "index$" => 0,
                },
              ],
              "key$" => "list",
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
