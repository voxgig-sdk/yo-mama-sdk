

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { YoMamaSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


loadEnvLocal(__dirname + '/../../../.env.local')


describe('GetRandomJokeEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when YO_MAMA_TEST_LIVE=TRUE.
  afterEach(liveDelay('YO_MAMA_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = YoMamaSDK.test()
    const ent = testsdk.GetRandomJoke()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.YO_MAMA_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'get_random_joke.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"joke":{"a":true,"h":"Joke","n":"joke","r":true,"sh":"The joke text","t":"`$STRING`","key$":"joke","index$":0}},"name":"get_random_joke","op":{"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /","source":"openapi3","version":2},"g":{},"k":"http","m":"GET","o":"/","q":{},"r":{},"s":[],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"get_random_joke","name__orig":"get_random_joke","Name":"GetRandomJoke","name_":"get_random_joke","name-":"get-random-joke","NAME":"GET_RANDOM_JOKE","index$":1}, {"active":true,"entity":"get_random_joke","key$":"BasicGetRandomJokeFlow","kind":"basic","name":"BasicGetRandomJokeFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"get_random_joke_ref01","srcdatavar":"get_random_joke_ref01_data","suffix":"_dt0"},"m":{},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-get_random_joke_ref01"}}],"index$":0}]}, 'GetRandomJoke', {"GET /":{"protocol":"http","operationId":"getRandomJoke","responses":{"200":{"description":"Successful response with a random joke","content":{"application/json":{"schema":{"type":"object","properties":{"joke":{"description":"The joke text","key$":"joke","type":"string"}},"required":["joke"],"x-ref":"#/components/schemas/Joke","index$":0},"example":{"joke":"Yo mama is so fat, when she skips a meal, the stock market drops."}}}}},"parameters":[],"securitySource":"unspecified"}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let get_random_joke_ref01_data = Object.values(setup.data.existing.get_random_joke)[0] as any

    // LOAD
    const get_random_joke_ref01_ent = client.GetRandomJoke()
    const get_random_joke_ref01_match_dt0: any = {}
    const get_random_joke_ref01_data_dt0 = (await get_random_joke_ref01_ent.load(get_random_joke_ref01_match_dt0)).data()
    assert(null != get_random_joke_ref01_data_dt0)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/get_random_joke/GetRandomJokeTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = YoMamaSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['get_random_joke01','get_random_joke02','get_random_joke03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'YO_MAMA_TEST_GET_RANDOM_JOKE_ENTID': idmap,
    'YO_MAMA_TEST_LIVE': 'FALSE',
    'YO_MAMA_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['YO_MAMA_TEST_GET_RANDOM_JOKE_ENTID']

  const live = 'TRUE' === env.YO_MAMA_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['YO_MAMA_TEST_GET_RANDOM_JOKE_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new YoMamaSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.YO_MAMA_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
