<?php

namespace App\Plugins\Ecommerce\Forms\Fronts;

use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\TextareaFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Enums\OrderCancellationReasonEnum;
use App\Plugins\Ecommerce\Http\Requests\Fronts\CancelOrderRequest;

class CancelOrderForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->contentOnly()
            ->setFormOption('id', 'cancel-order-form')
            ->setValidatorClass(CancelOrderRequest::class)
            ->setUrl(route('customer.orders.cancel.post', $this->getModel()->id))
            ->add(
                'cancellation_reason',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('Choose a Reason for Order Cancellation'))
                    ->choices([
                        '' => __('Choose a reason...'),
                        ...OrderCancellationReasonEnum::labels(),
                    ])
                    ->required()
            )
            ->add(
                'cancellation_reason_description',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(__('Description'))
            );
    }
}
