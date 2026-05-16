<?php
declare(strict_types=1);

// YoMama SDK utility: feature_hook

class YoMamaFeatureHook
{
    public static function call(YoMamaContext $ctx, string $name): void
    {
        if (!$ctx->client) {
            return;
        }
        $features = $ctx->client->features ?? null;
        if (!$features) {
            return;
        }
        foreach ($features as $f) {
            if (method_exists($f, $name)) {
                $f->$name($ctx);
            }
        }
    }
}
