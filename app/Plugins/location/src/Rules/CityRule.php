<?php

namespace App\Plugins\Location\Rules;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Plugins\Location\Models\City;
use Illuminate\Contracts\Validation\DataAwareRule;
use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Arr;

class CityRule implements DataAwareRule, Rule
{
    protected array $data = [];

    public function __construct(protected ?string $stateKey = '')
    {
    }

    public function setData($data): self
    {
        $this->data = $data;

        return $this;
    }

    public function passes($attribute, $value): bool
    {
        $condition = [
            'id' => $value,
            'status' => BaseStatusEnum::PUBLISHED,
        ];

        if ($this->stateKey && ($stateId = Arr::get($this->data, $this->stateKey))) {
            $condition['state_id'] = $stateId;
        }

        return City::query()->where($condition)->exists();
    }

    public function message(): string
    {
        return trans('validation.exists');
    }
}
