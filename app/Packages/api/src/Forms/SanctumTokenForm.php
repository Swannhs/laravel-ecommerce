<?php

namespace App\Packages\Api\Forms;

use App\Packages\Api\Http\Requests\StoreSanctumTokenRequest;
use App\Packages\Api\Models\PersonalAccessToken;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;

class SanctumTokenForm extends FormAbstract
{
    public function buildForm(): void
    {
        $this
            ->setupModel(new PersonalAccessToken())
            ->setValidatorClass(StoreSanctumTokenRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->toArray());
    }
}
