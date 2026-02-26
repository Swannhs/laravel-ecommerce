<?php

namespace App\Plugins\Marketplace\Forms;

use App\Plugins\Marketplace\Forms\Fields\CustomEditorField;
use App\Plugins\Marketplace\Http\Requests\Fronts\VendorStoreRequest;

class VendorStoreForm extends StoreForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setValidatorClass(VendorStoreRequest::class)
            ->modify('content', CustomEditorField::class)
            ->remove(['status', 'customer_id']);
    }
}
