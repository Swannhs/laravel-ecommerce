<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;

class UpdateProductInventoryRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'column' => ['required', 'in:with_storehouse_management,quantity,stock_status'],
        ];

        if ($this->input('column') === 'with_storehouse_management') {
            $rules['value'] = [new OnOffRule()];
        } elseif ($this->input('column') === 'quantity') {
            $rules['value'] = ['required', 'numeric'];
        } else {
            $rules['value'] = ['required', 'in:in_stock,out_of_stock,on_backorder'];
        }

        return $rules;
    }
}
