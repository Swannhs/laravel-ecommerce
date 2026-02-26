<?php

namespace App\Core\Base\Contracts;

interface HasTreeCategory
{
    public static function updateTree(array $data): void;
}
