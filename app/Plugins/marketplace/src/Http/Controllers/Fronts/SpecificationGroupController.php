<?php

namespace App\Plugins\Marketplace\Http\Controllers\Fronts;

use App\Plugins\Ecommerce\Http\Controllers\SpecificationGroupController as BaseSpecificationGroupController;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Ecommerce\Models\SpecificationGroup;
use App\Plugins\Marketplace\Forms\SpecificationGroupForm;
use App\Plugins\Marketplace\Tables\SpecificationGroupTable;

class SpecificationGroupController extends BaseSpecificationGroupController
{
    protected function getTable(): string
    {
        return SpecificationGroupTable::class;
    }

    protected function getForm(): string
    {
        return SpecificationGroupForm::class;
    }

    protected function getAdditionalDataForSaving(): array
    {
        return [
            'author_type' => Customer::class,
            'author_id' => auth('customer')->id(),
        ];
    }

    protected function getIndexRouteName(): string
    {
        return 'marketplace.vendor.specification-groups.index';
    }

    protected function getEditRouteName(): string
    {
        return 'marketplace.vendor.specification-groups.edit';
    }

    protected function getSpecificationGroup(string $group)
    {
        return SpecificationGroup::query()
            ->where([
                'author_type' => Customer::class,
                'author_id' => auth('customer')->id(),
            ])
            ->findOrFail($group);
    }
}
