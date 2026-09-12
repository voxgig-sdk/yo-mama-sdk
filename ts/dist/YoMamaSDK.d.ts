import { CategoryEntity } from './entity/CategoryEntity';
import { GetRandomJokeEntity } from './entity/GetRandomJokeEntity';
import { JokeEntity } from './entity/JokeEntity';
export type * from './YoMamaTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { YoMamaEntityBase } from './YoMamaEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class YoMamaSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Category(entopts?: Record<string, any>): CategoryEntity;
    GetRandomJoke(entopts?: Record<string, any>): GetRandomJokeEntity;
    Joke(entopts?: Record<string, any>): JokeEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): YoMamaSDK;
    tester(testopts?: any, sdkopts?: any): YoMamaSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof YoMamaSDK;
export { stdutil, config, BaseFeature, YoMamaEntityBase, YoMamaSDK, SDK, };
