import { Context } from './Context';
declare class YoMamaError extends Error {
    isYoMamaError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { YoMamaError };
