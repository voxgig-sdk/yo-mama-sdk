
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { YoMamaSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await YoMamaSDK.test()
    equal(null !== testsdk, true)
  })

})
