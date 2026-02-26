<?php

namespace App\Plugins\Contact\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Contact\Http\Requests\ContactRequest;
use App\Plugins\Contact\Services\ContactService;
use Illuminate\Validation\ValidationException;

class PublicController extends BaseController
{
    public function __construct(protected ContactService $contactService)
    {
    }

    public function postSendContact(ContactRequest $request)
    {
        try {
            $result = $this->contactService->sendContact($request);

            if (! $result['success']) {
                return $this
                    ->httpResponse()
                    ->setError()
                    ->setMessage($result['message']);
            }

            return $this
                ->httpResponse()
                ->setMessage($result['message']);
        } catch (ValidationException $exception) {
            throw $exception;
        }
    }
}
