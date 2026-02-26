<?php

namespace App\Plugins\Contact\Http\Controllers;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\EmailHandler;
use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Contact\Enums\ContactStatusEnum;
use App\Plugins\Contact\Forms\ContactForm;
use App\Plugins\Contact\Http\Requests\ContactReplyRequest;
use App\Plugins\Contact\Http\Requests\EditContactRequest;
use App\Plugins\Contact\Models\Contact;
use App\Plugins\Contact\Models\ContactReply;
use App\Plugins\Contact\Tables\ContactTable;
use App\Packages\Theme\Facades\Theme;
use Illuminate\Validation\ValidationException;

class ContactController extends BaseController
{
    public function index(ContactTable $dataTable)
    {
        $this->pageTitle(trans('plugins/contact::contact.menu'));

        return $dataTable->renderTable();
    }

    public function edit(Contact $contact)
    {
        $this
            ->breadcrumb()
            ->add(trans('plugins/contact::contact.menu'), route('contacts.index'));

        $this->pageTitle(trans('plugins/contact::contact.edit'));

        return ContactForm::createFromModel($contact)->renderForm();
    }

    public function update(Contact $contact, EditContactRequest $request)
    {
        ContactForm::createFromModel($contact)->setRequest($request)->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('contacts.index')
            ->withUpdatedSuccessMessage();
    }

    public function destroy(Contact $contact)
    {
        return DeleteResourceAction::make($contact);
    }

    public function postReply(Contact $contact, ContactReplyRequest $request)
    {
        $message = BaseHelper::clean($request->input('message'));

        if (! $message) {
            throw ValidationException::withMessages(['message' => trans('validation.required', ['attribute' => 'message'])]);
        }

        if (! $contact->email || ! filter_var($contact->email, FILTER_VALIDATE_EMAIL)) {
            throw ValidationException::withMessages([
                'message' => trans('plugins/contact::contact.email_invalid_for_reply'),
            ]);
        }

        $args = [
            'contact_name' => $contact->name,
            'contact_subject' => $contact->subject,
            'contact_email' => $contact->email,
            'contact_content' => $contact->content,
            'admin_reply_message' => $message,
            'site_title' => Theme::getSiteTitle(),
        ];

        $emailHandler = EmailHandler::setModule(CONTACT_MODULE_SCREEN_NAME)
            ->setVariableValues($args);

        $emailHandler->sendUsingTemplate('admin-reply', $contact->email);

        ContactReply::query()->create([
            'message' => $message,
            'contact_id' => $contact->getKey(),
        ]);

        $contact->status = ContactStatusEnum::READ();
        $contact->save();

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/contact::contact.message_sent_success'));
    }
}
