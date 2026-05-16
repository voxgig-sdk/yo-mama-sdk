<?php
declare(strict_types=1);

// YoMama SDK utility: result_body

class YoMamaResultBody
{
    public static function call(YoMamaContext $ctx): ?YoMamaResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
