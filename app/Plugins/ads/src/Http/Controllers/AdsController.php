<?php

namespace App\Plugins\Ads\Http\Controllers;

use App\Plugins\Ads\Forms\AdsForm;
use App\Plugins\Ads\Http\Requests\AdsRequest;
use App\Plugins\Ads\Models\Ads;
use App\Plugins\Ads\Tables\AdsTable;
use App\Core\Base\Events\BeforeEditContentEvent;
use App\Core\Base\Facades\PageTitle;
use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Http\Controllers\BaseController;
use App\Core\Base\Http\Responses\BaseHttpResponse;
use Illuminate\Http\Request;

class AdsController extends BaseController
{
    public function index(AdsTable $table)
    {
        PageTitle::setTitle(trans('plugins/ads::ads.name'));

        return $table->renderTable();
    }

    public function create()
    {
        PageTitle::setTitle(trans('plugins/ads::ads.create'));

        return AdsForm::create()->renderForm();
    }

    public function store(AdsRequest $request, BaseHttpResponse $response)
    {
        $form = AdsForm::create()->setRequest($request);
        $form->save();

        return $response
            ->setPreviousUrl(route('ads.index'))
            ->setNextUrl(route('ads.edit', $form->getModel()->id))
            ->withCreatedSuccessMessage();
    }

    public function edit(Ads $ads, Request $request)
    {
        event(new BeforeEditContentEvent($request, $ads));

        PageTitle::setTitle(trans('core/base::forms.edit_item', ['name' => $ads->name]));

        return AdsForm::createFromModel($ads)->renderForm();
    }

    public function update(Ads $ads, AdsRequest $request, BaseHttpResponse $response)
    {
        AdsForm::createFromModel($ads)
            ->setRequest($request)
            ->save();

        return $response
            ->setPreviousUrl(route('ads.index'))
            ->withUpdatedSuccessMessage();
    }

    public function destroy(Ads $ads)
    {
        return DeleteResourceAction::make($ads);
    }
}
