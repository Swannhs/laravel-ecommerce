<?php

namespace App\Plugins\Ecommerce\Forms\Settings;

use App\Core\Base\Forms\FieldOptions\CheckboxFieldOption;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\OnOffCheckboxField;
use App\Plugins\Ecommerce\Facades\FlashSale;
use App\Plugins\Ecommerce\Http\Requests\Settings\FlashSaleSettingRequest;
use App\Core\Setting\Forms\SettingForm;

class FlashSaleSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/ecommerce::setting.flash_sale.name'))
            ->setSectionDescription(trans('plugins/ecommerce::setting.flash_sale.description'))
            ->setValidatorClass(FlashSaleSettingRequest::class)
            ->add(
                'flash_sale_enabled',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.flash_sale.enable'))
                    ->helperText(trans('plugins/ecommerce::setting.flash_sale.enable_helper'))
                    ->value(FlashSale::isEnabled())
                    ->attributes([
                        'data-bb-toggle' => 'collapse',
                        'data-bb-target' => '#flash-sale-settings',
                    ]),
            )
            ->add('open_wrapper', HtmlField::class, [
                'html' => sprintf('<div id="flash-sale-settings" style="display: %s">', get_ecommerce_setting('flash_sale_enabled', true) ? 'block' : 'none'),
            ])
            ->add('close_wrapper', HtmlField::class, [
                'html' => '</div>',
            ]);
    }
}
