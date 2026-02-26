<?php

namespace App\Packages\DataSynchronize\Contracts\Importer;

interface WithMapping
{
    public function map(mixed $row): array;
}
