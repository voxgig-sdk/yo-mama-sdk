<?php
declare(strict_types=1);

// YoMama SDK utility: prepare_body

class YoMamaPrepareBody
{
    public static function call(YoMamaContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
