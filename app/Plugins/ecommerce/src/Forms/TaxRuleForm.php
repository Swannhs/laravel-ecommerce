<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Forms\FieldOptions\NumberFieldOption;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Forms\Concerns\HasLocationFields;
use App\Plugins\Ecommerce\Forms\Concerns\HasSubmitButton;
use App\Plugins\Ecommerce\Http\Requests\TaxRuleRequest;
use App\Plugins\Ecommerce\Models\Tax;
use App\Plugins\Ecommerce\Models\TaxRule;
use Illuminate\Support\Facades\Request;

class TaxRuleForm extends FormAbstract
{
    use HasLocationFields;
    use HasSubmitButton;

    public function setup(): void
    {
        $this
            ->model(TaxRule::class)
            ->setValidatorClass(TaxRuleRequest::class)
            ->setFormOption('id', 'ecommerce-tax-rule-form')
            ->when(Request::ajax(), function (FormAbstract $form): void {
                $form->contentOnly();
            });

        if (! $this->getModel()->getKey()) {
            $this
                ->when(
                    $taxId = request()->input('tax_id'),
                    fn (FormAbstract $form) => $form->add('tax_id', 'hidden', [
                        'value' => $taxId,
                    ]),
                    function (FormAbstract $form): void {
                        $taxes = Tax::query()->pluck('title', 'id')->all();
                        $form
                            ->add('tax_id', 'customSelect', [
                                'label' => trans('plugins/ecommerce::tax.tax'),
                                'choices' => $taxes,
                            ]);
                    }
                );
        }

        $this
            ->addLocationFields(countryAttributes: ['required' => true])
            ->remove('address')
            ->add(
                'percentage',
                NumberField::class,
                NumberFieldOption::make()
                    ->label(trans('plugins/ecommerce::tax.percentage'))
                    ->attributes(['step' => '0.01'])
                    ->required()
            )
            ->when($this->request->ajax(), function (TaxRuleForm $form): void {
                $form->addSubmitButton(trans('core/base::forms.save'), 'ti ti-device-floppy', [
                    'wrapper' => [
                        'class' => 'd-grid gap-2',
                    ],
                ]);
            });
    }
}
