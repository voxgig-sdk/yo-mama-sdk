<?php
declare(strict_types=1);

// YoMama SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class YoMamaFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new YoMamaBaseFeature();
            case "test":
                return new YoMamaTestFeature();
            default:
                return new YoMamaBaseFeature();
        }
    }
}
