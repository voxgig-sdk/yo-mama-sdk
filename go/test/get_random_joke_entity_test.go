package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/yo-mama-sdk/go"
	"github.com/voxgig-sdk/yo-mama-sdk/go/core"

	vs "github.com/voxgig-sdk/yo-mama-sdk/go/utility/struct"
)

func TestGetRandomJokeEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.GetRandomJoke(nil)
		if ent == nil {
			t.Fatal("expected non-nil GetRandomJokeEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := get_random_jokeBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "get_random_joke." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set YOMAMA_TEST_GET_RANDOM_JOKE_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		getRandomJokeRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.get_random_joke", setup.data)))
		var getRandomJokeRef01Data map[string]any
		if len(getRandomJokeRef01DataRaw) > 0 {
			getRandomJokeRef01Data = core.ToMapAny(getRandomJokeRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = getRandomJokeRef01Data

		// LOAD
		getRandomJokeRef01Ent := client.GetRandomJoke(nil)
		getRandomJokeRef01MatchDt0 := map[string]any{}
		getRandomJokeRef01DataDt0Loaded, err := getRandomJokeRef01Ent.Load(getRandomJokeRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		if getRandomJokeRef01DataDt0Loaded == nil {
			t.Fatal("expected load result to be non-nil")
		}

	})
}

func get_random_jokeBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "get_random_joke", "GetRandomJokeTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read get_random_joke test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse get_random_joke test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"get_random_joke01", "get_random_joke02", "get_random_joke03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("YOMAMA_TEST_GET_RANDOM_JOKE_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"YOMAMA_TEST_GET_RANDOM_JOKE_ENTID": idmap,
		"YOMAMA_TEST_LIVE":      "FALSE",
		"YOMAMA_TEST_EXPLAIN":   "FALSE",
		"YOMAMA_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["YOMAMA_TEST_GET_RANDOM_JOKE_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["YOMAMA_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["YOMAMA_APIKEY"],
			},
			extra,
		})
		client = sdk.NewYoMamaSDK(core.ToMapAny(mergedOpts))
	}

	live := env["YOMAMA_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["YOMAMA_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
