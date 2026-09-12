import { YoMamaEntityBase } from '../YoMamaEntityBase';
import type { YoMamaSDK } from '../YoMamaSDK';
import type { Control } from '../types';
import type { Category, CategoryListMatch } from '../YoMamaTypes';
declare class CategoryEntity extends YoMamaEntityBase<Category> {
    constructor(client: YoMamaSDK, entopts: any);
    make(this: CategoryEntity): CategoryEntity;
    list(this: any, reqmatch?: CategoryListMatch, ctrl?: Control): Promise<CategoryEntity[]>;
}
export { CategoryEntity };
