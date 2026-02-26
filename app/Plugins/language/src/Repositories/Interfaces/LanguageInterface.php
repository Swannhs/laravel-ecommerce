<?php

namespace App\Plugins\Language\Repositories\Interfaces;

use App\Core\Base\Models\BaseModel;
use App\Plugins\Language\Models\Language;
use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

interface LanguageInterface extends RepositoryInterface
{
    public function getActiveLanguage(array $select = ['*']): Collection;

    public function getDefaultLanguage(array $select = ['*']): BaseModel|Model|Language|null;
}
