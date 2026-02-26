<?php

namespace App\Packages\Api\Models;

use App\Core\Base\Contracts\BaseModel;
use App\Core\Base\Models\Concerns\HasBaseEloquentBuilder;
use App\Core\Base\Models\Concerns\HasMetadata;
use App\Core\Base\Models\Concerns\HasUuidsOrIntegerIds;
use Laravel\Sanctum\PersonalAccessToken as SanctumPersonalAccessToken;

class PersonalAccessToken extends SanctumPersonalAccessToken implements BaseModel
{
    use HasMetadata;
    use HasUuidsOrIntegerIds;
    use HasBaseEloquentBuilder;
}
