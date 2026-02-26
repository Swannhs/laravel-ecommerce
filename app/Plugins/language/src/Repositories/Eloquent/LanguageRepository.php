<?php

namespace App\Plugins\Language\Repositories\Eloquent;

use App\Core\Base\Models\BaseModel;
use App\Plugins\Language\Models\Language;
use App\Plugins\Language\Repositories\Interfaces\LanguageInterface;
use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

class LanguageRepository extends RepositoriesAbstract implements LanguageInterface
{
    public function getActiveLanguage(array $select = ['*']): Collection
    {
        $data = $this->model->orderBy('lang_order')->select($select)->get();
        $this->resetModel();

        return $data;
    }

    public function getDefaultLanguage(array $select = ['*']): BaseModel|Model|Language|null
    {
        $data = $this->model->where('lang_is_default', 1)->select($select)->first();
        $this->resetModel();

        return $data;
    }
}
