
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { YoMamaSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = YoMamaSDK.test()
    equal(testsdk instanceof YoMamaSDK, true,
      'YoMamaSDK.test() must return a client synchronously')
  })

})
