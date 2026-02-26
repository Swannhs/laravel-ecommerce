<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Forms\FieldOptions\DatePickerFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\Fields\DatePickerField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Http\Requests\FlashSaleRequest;
use App\Plugins\Ecommerce\Models\FlashSale;
use Carbon\Carbon;

class FlashSaleForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/flash-sale.js')
            ->addStylesDirectly(['vendor/core/plugins/ecommerce/css/ecommerce.css'])
            ->addScripts(['input-mask']);

        $this
            ->model(FlashSale::class)
            ->setValidatorClass(FlashSaleRequest::class)
            ->add('name', TextField::class, NameFieldOption::make())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add(
                'end_date',
                DatePickerField::class,
                DatePickerFieldOption::make()
                    ->label(__('End date'))
                    ->required()
                    ->defaultValue(BaseHelper::formatDate(Carbon::now()->addMonth()))
            )
            ->addMetaBoxes([
                'products' => [
                    'title' => trans('plugins/ecommerce::flash-sale.products'),
                    'content' => view('plugins/ecommerce::flash-sales.products', [
                        'flashSale' => $this->getModel(),
                        'products' => $this->getModel()->getKey() ? $this->getModel()->products : collect(),
                    ]),
                    'priority' => 0,
                ],
            ])
            ->setBreakFieldPoint('status');
    }
}
