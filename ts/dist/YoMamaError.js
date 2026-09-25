"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.YoMamaError = void 0;
class YoMamaError extends Error {
    isYoMamaError = true;
    sdk = 'YoMama';
    code;
    ctx;
    status = -1;
    // `err.notFound` rather than a magic number at every call site.
    get notFound() { return 404 === this.status; }
    constructor(code, msg, ctx) {
        super(msg);
        this.code = code;
        this.ctx = ctx;
    }
}
exports.YoMamaError = YoMamaError;
//# sourceMappingURL=YoMamaError.js.map