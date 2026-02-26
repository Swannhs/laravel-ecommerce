<?php

namespace App\Plugins\Newsletter\Http\Controllers;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Forms\FieldOptions\CheckboxFieldOption;
use App\Core\Base\Forms\FieldOptions\EmailFieldOption;
use App\Core\Base\Forms\Fields\CheckboxField;
use App\Core\Base\Forms\Fields\EmailField;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Newsletter\Enums\NewsletterStatusEnum;
use App\Plugins\Newsletter\Events\SubscribeNewsletterEvent;
use App\Plugins\Newsletter\Events\UnsubscribeNewsletterEvent;
use App\Plugins\Newsletter\Forms\Fronts\NewsletterForm;
use App\Plugins\Newsletter\Http\Requests\NewsletterRequest;
use App\Plugins\Newsletter\Models\Newsletter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class PublicController extends BaseController
{
    public function postSubscribe(NewsletterRequest $request)
    {
        do_action('form_extra_fields_validate', $request, NewsletterForm::class);

        $newsletterForm = NewsletterForm::create();
        $newsletterForm->setRequest($request);

        $newsletterForm->onlyValidatedData()->saving(function (NewsletterForm $form): void {
            /**
             * @var NewsletterRequest $request
             */
            $request = $form->getRequest();

            /**
             * @var Newsletter $newsletter
             */
            $newsletter = $form->getModel()->newQuery()->firstOrNew([
                'email' => $request->input('email'),
            ], [
                ...$form->getRequestData(),
                'status' => NewsletterStatusEnum::SUBSCRIBED,
            ]);

            $newsletter->save();

            SubscribeNewsletterEvent::dispatch($newsletter);
        });

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/newsletter::newsletter.subscribe_success'));
    }

    public function getUnsubscribe(int|string $id, Request $request)
    {
        abort_unless(URL::hasValidSignature($request), 404);

        /**
         * @var Newsletter $newsletter
         */
        $newsletter = Newsletter::query()
            ->where([
                'id' => $id,
                'status' => NewsletterStatusEnum::SUBSCRIBED,
            ])
            ->first();

        if ($newsletter) {
            $newsletter->update(['status' => NewsletterStatusEnum::UNSUBSCRIBED]);

            UnsubscribeNewsletterEvent::dispatch($newsletter);

            return $this
                ->httpResponse()
                ->setNextUrl(BaseHelper::getHomepageUrl())
                ->setMessage(trans('plugins/newsletter::newsletter.unsubscribe_success'));
        }

        return $this
            ->httpResponse()
            ->setError()
            ->setNextUrl(BaseHelper::getHomepageUrl())
            ->setMessage(trans('plugins/newsletter::newsletter.email_not_exist_or_unsubscribed'));
    }

    public function ajaxLoadPopup()
    {
        $newsletterForm = NewsletterForm::create()
            ->remove(['wrapper_before', 'wrapper_after', 'email'])
            ->addBefore(
                'submit',
                'email',
                EmailField::class,
                EmailFieldOption::make()
                    ->label(trans('plugins/newsletter::newsletter.email_address'))
                    ->maxLength(-1)
                    ->placeholder(trans('plugins/newsletter::newsletter.enter_your_email'))
                    ->required()
            )
            ->addAfter(
                'submit',
                'dont_show_again',
                CheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/newsletter::newsletter.dont_show_popup_again'))
                    ->value(false)
            );

        return $this
            ->httpResponse()
            ->setData([
                'html' => view('plugins/newsletter::partials.popup', compact('newsletterForm'))->render(),
            ]);
    }
}
