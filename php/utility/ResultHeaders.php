<?php
declare(strict_types=1);

// YoMama SDK utility: result_headers

class YoMamaResultHeaders
{
    public static function call(YoMamaContext $ctx): ?YoMamaResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
