<?php
declare(strict_types=1);

// YoMama SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class YoMamaMakeContext
{
    public static function call(array $ctxmap, ?YoMamaContext $basectx): YoMamaContext
    {
        return new YoMamaContext($ctxmap, $basectx);
    }
}
