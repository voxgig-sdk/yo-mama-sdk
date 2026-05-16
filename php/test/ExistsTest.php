<?php
declare(strict_types=1);

// YoMama SDK exists test

require_once __DIR__ . '/../yomama_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = YoMamaSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
