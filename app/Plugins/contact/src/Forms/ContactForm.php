<?php

namespace App\Plugins\Contact\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Contact\Enums\ContactStatusEnum;
use App\Plugins\Contact\Http\Requests\EditContactRequest;
use App\Plugins\Contact\Models\Contact;

class ContactForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addScriptsDirectly('vendor/core/plugins/contact/js/contact.js')
            ->addStylesDirectly('vendor/core/plugins/contact/css/contact.css');

        $this
            ->model(Contact::class)
            ->setValidatorClass(EditContactRequest::class)
            ->add(
                'status',
                SelectField::class,
                StatusFieldOption::make()
                    ->choices(ContactStatusEnum::labels())
            )
            ->setBreakFieldPoint('status')
            ->addMetaBoxes([
                'information' => [
                    'title' => trans('plugins/contact::contact.contact_information'),
                    'content' => view('plugins/contact::contact-info', ['contact' => $this->getModel()])->render(),
                ],
                'replies' => [
                    'title' => trans('plugins/contact::contact.replies'),
                    'content' => view('plugins/contact::reply-box', ['contact' => $this->getModel()])->render(),
                ],
            ]);
    }
}
