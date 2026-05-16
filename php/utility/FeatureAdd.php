<?php
declare(strict_types=1);

// YoMama SDK utility: feature_add

class YoMamaFeatureAdd
{
    public static function call(YoMamaContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
