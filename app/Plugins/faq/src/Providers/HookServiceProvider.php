<?php

namespace App\Plugins\Faq\Providers;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Core\Base\Facades\MetaBox;
use App\Core\Base\Models\BaseModel;
use App\Core\Base\Supports\ServiceProvider;
use App\Plugins\Faq\Contracts\Faq as FaqContract;
use App\Plugins\Faq\FaqCollection;
use App\Plugins\Faq\FaqItem;
use App\Plugins\Faq\FaqSupport;
use App\Plugins\Faq\Models\Faq;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        add_action(BASE_ACTION_META_BOXES, function (string $context, array|string|Model|null $object = null): void {
            if (
                ! $object instanceof BaseModel
                || $context != 'advanced'
                || ! in_array($object::class, config('plugins.faq.general.schema_supported', []))
                || ! setting('enable_faq_schema', 0)
            ) {
                return;
            }

            MetaBox::addMetaBox(
                'faq_schema_config_wrapper',
                trans('plugins/faq::faq.faq_schema_config', [
                    'link' => Html::link(
                        'https://developers.google.com/search/docs/appearance/structured-data/faqpage',
                        trans('plugins/faq::faq.learn_more'),
                        ['target' => '_blank']
                    ),
                ]),
                function () {
                    return (new FaqSupport())->renderMetaBox(func_get_args()[0] ?? null);
                },
                $object::class,
                $context
            );
        }, 39, 2);

        add_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, function ($screen, $object): void {
            if (
                ! in_array($object::class, config('plugins.faq.general.schema_supported', []))
                || ! setting('enable_faq_schema', 0)
            ) {
                return;
            }

            $faqs = (array) $object->getMetaData('faq_schema_config', true);

            if (is_plugin_active('faq')) {
                $selectedExistingFaqs = $object->getMetaData('faq_ids', true);

                if ($selectedExistingFaqs && is_array($selectedExistingFaqs)) {
                    $selectedExistingFaqs = array_filter($selectedExistingFaqs);

                    if ($selectedExistingFaqs) {
                        $selectedFaqs = Faq::query()
                            ->wherePublished()
                            ->whereIn('id', $selectedExistingFaqs)
                            ->pluck('answer', 'question')
                            ->all();

                        foreach ($selectedFaqs as $question => $answer) {
                            $faqs[] = [
                                [
                                    'key' => 'question',
                                    'value' => $question,
                                ],
                                [
                                    'key' => 'answer',
                                    'value' => $answer,
                                ],
                            ];
                        }
                    }
                }
            }

            $faqs = array_filter($faqs);

            if (empty($faqs)) {
                return;
            }

            foreach ($faqs as $key => $item) {
                if (! $item[0]['value'] && ! $item[1]['value']) {
                    Arr::forget($value, $key);
                }
            }

            $schemaItems = new FaqCollection();

            foreach ($faqs as $item) {
                $schemaItems->push(
                    new FaqItem(BaseHelper::clean($item[0]['value']), BaseHelper::clean($item[1]['value']))
                );
            }

            app(FaqContract::class)->registerSchema($schemaItems);
        }, 39, 2);
    }
}
