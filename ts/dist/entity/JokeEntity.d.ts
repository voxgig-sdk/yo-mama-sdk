import { YoMamaEntityBase } from '../YoMamaEntityBase';
import type { YoMamaSDK } from '../YoMamaSDK';
import type { Control } from '../types';
import type { Joke, JokeListMatch } from '../YoMamaTypes';
declare class JokeEntity extends YoMamaEntityBase<Joke> {
    constructor(client: YoMamaSDK, entopts: any);
    make(this: JokeEntity): JokeEntity;
    list(this: any, reqmatch?: JokeListMatch, ctrl?: Control): Promise<JokeEntity[]>;
}
export { JokeEntity };
