<?php

namespace App\Plugins\Ads\Forms;

use App\Plugins\Ads\Facades\AdsManager;
use App\Plugins\Ads\Http\Requests\AdsRequest;
use App\Plugins\Ads\Models\Ads;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Forms\FieldOptions\DatePickerFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\SortOrderFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\DatePickerField;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use Carbon\Carbon;
use Illuminate\Support\Str;

class AdsForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Ads::class)
            ->setValidatorClass(AdsRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add('key', TextField::class, [
                'label' => trans('plugins/ads::ads.key'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('plugins/ads::ads.key'),
                    'data-counter' => 255,
                ],
                'default_value' => $this->generateAdsKey(),
            ])
            ->add('order', NumberField::class, SortOrderFieldOption::make())
            ->add(
                'ads_type',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ads::ads.ads_type'))
                    ->choices([
                        'custom_ad' => trans('plugins/ads::ads.custom_ad'),
                        'google_adsense' => 'Google AdSense',
                    ])
            )
            ->addOpenCollapsible('ads_type', 'google_adsense', $this->getModel()->ads_type)
            ->add(
                'google_adsense_slot_id',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/ads::ads.google_adsense_slot_id'))
                    ->placeholder('E.g: 1234567890')
            )
            ->addCloseCollapsible('ads_type', 'google_adsense')
            ->addOpenCollapsible('ads_type', 'custom_ad', $this->getModel()->ads_type ?? 'custom_ad')
            ->add('url', TextField::class, [
                'label' => trans('plugins/ads::ads.url'),
                'attr' => [
                    'placeholder' => trans('plugins/ads::ads.url'),
                    'data-counter' => 255,
                ],
            ])
            ->add('open_in_new_tab', OnOffField::class, [
                'label' => trans('plugins/ads::ads.open_in_new_tab'),
                'default_value' => true,
            ])
            ->add('image', MediaImageField::class, MediaImageFieldOption::make())
            ->add('tablet_image', MediaImageField::class, [
                'label' => trans('plugins/ads::ads.tablet_image'),
                'help_block' => [
                    'text' => trans('plugins/ads::ads.tablet_image_helper'),
                ],
            ])
            ->add('mobile_image', MediaImageField::class, [
                'label' => trans('plugins/ads::ads.mobile_image'),
                'help_block' => [
                    'text' => trans('plugins/ads::ads.mobile_image_helper'),
                ],
            ])
            ->addCloseCollapsible('ads_type', 'custom_ad')
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->when(($adLocations = AdsManager::getLocations()) && count($adLocations) > 1, function () use ($adLocations): void {
                $this->add(
                    'location',
                    SelectField::class,
                    SelectFieldOption::make()
                        ->label(trans('plugins/ads::ads.location'))
                        ->helperText(trans('plugins/ads::ads.location_helper'))
                        ->choices($adLocations)
                        ->searchable()
                        ->required()
                );
            })
            ->add(
                'expired_at',
                DatePickerField::class,
                DatePickerFieldOption::make()
                    ->label(trans('plugins/ads::ads.expired_at'))
                    ->defaultValue(BaseHelper::formatDate(Carbon::now()->addMonth()))
                    ->helperText(trans('plugins/ads::ads.expired_at_helper'))
            )
            ->setBreakFieldPoint('status');
    }

    protected function generateAdsKey(): string
    {
        do {
            $key = strtoupper(Str::random(12));
        } while (Ads::query()->where('key', $key)->exists());

        return $key;
    }
}
