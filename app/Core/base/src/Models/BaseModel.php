<?php

namespace App\Core\Base\Models;

use App\Core\Base\Contracts\BaseModel as BaseModelContract;
use App\Core\Base\Facades\MacroableModels;
use App\Core\Base\Models\Concerns\HasBaseEloquentBuilder;
use App\Core\Base\Models\Concerns\HasMetadata;
use App\Core\Base\Models\Concerns\HasUuidsOrIntegerIds;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

/**
 * @method static \App\Core\Base\Models\BaseQueryBuilder query()
 */
class BaseModel extends Model implements BaseModelContract
{
    use HasBaseEloquentBuilder;
    use HasMetadata;
    use HasUuidsOrIntegerIds;

    public function __get($key)
    {
        if (MacroableModels::modelHasMacro(static::class, $method = 'get' . Str::studly($key) . 'Attribute')) {
            return $this->{$method}();
        }

        return parent::__get($key);
    }
}
