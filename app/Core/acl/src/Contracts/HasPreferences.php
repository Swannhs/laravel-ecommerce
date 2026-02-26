<?php

namespace App\Core\ACL\Contracts;

use Illuminate\Database\Eloquent\Relations\HasMany;

interface HasPreferences
{
    public function meta(): HasMany;

    public function setMeta(string $key, mixed $value): bool;

    public function getMeta(string $key, mixed $default = null): mixed;
}
