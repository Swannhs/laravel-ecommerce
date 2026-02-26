<?php

namespace App\Plugins\Newsletter\Contracts;

interface Factory
{
    public function driver(string $driver);
}
