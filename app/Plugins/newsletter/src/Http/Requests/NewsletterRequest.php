<?php

namespace App\Plugins\Newsletter\Http\Requests;

use App\Plugins\Newsletter\Enums\NewsletterStatusEnum;
use App\Plugins\Newsletter\Models\Newsletter;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Database\Query\Builder;
use Illuminate\Validation\Rule;

class NewsletterRequest extends Request
{
    protected $errorBag = 'newsletter';

    public function rules(): array
    {
        return [
            'email' => [
                'required',
                'email',
                Rule::unique((new Newsletter())->getTable())->where(function (Builder $query): void {
                    $query->where('status', NewsletterStatusEnum::SUBSCRIBED);
                }),
            ],
            'status' => Rule::in(NewsletterStatusEnum::values()),
        ];
    }
}
