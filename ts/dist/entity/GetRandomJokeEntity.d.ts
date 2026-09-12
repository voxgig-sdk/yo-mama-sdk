import { YoMamaEntityBase } from '../YoMamaEntityBase';
import type { YoMamaSDK } from '../YoMamaSDK';
import type { Control } from '../types';
import type { GetRandomJoke, GetRandomJokeLoadMatch } from '../YoMamaTypes';
declare class GetRandomJokeEntity extends YoMamaEntityBase<GetRandomJoke> {
    constructor(client: YoMamaSDK, entopts: any);
    make(this: GetRandomJokeEntity): GetRandomJokeEntity;
    load(this: any, reqmatch?: GetRandomJokeLoadMatch, ctrl?: Control): Promise<GetRandomJokeEntity>;
}
export { GetRandomJokeEntity };
