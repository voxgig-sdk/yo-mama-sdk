
import { Context } from './Context'


class YoMamaError extends Error {

  isYoMamaError = true

  sdk = 'YoMama'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  YoMamaError
}

