<?php

namespace App\Plugins\SimpleSlider\Http\Controllers;

use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\SimpleSlider\Forms\SimpleSliderItemForm;
use App\Plugins\SimpleSlider\Http\Requests\SimpleSliderItemRequest;
use App\Plugins\SimpleSlider\Models\SimpleSliderItem;
use App\Plugins\SimpleSlider\Tables\SimpleSliderItemTable;

class SimpleSliderItemController extends BaseController
{
    public function index(SimpleSliderItemTable $dataTable)
    {
        return $dataTable->renderTable();
    }

    public function create()
    {
        $form = SimpleSliderItemForm::create()
            ->setUseInlineJs(true)
            ->renderForm();

        return $this
            ->httpResponse()
            ->setData([
                'title' => trans('plugins/simple-slider::simple-slider.create_new_slide'),
                'content' => $form,
            ]);
    }

    public function store(SimpleSliderItemRequest $request)
    {
        SimpleSliderItemForm::create()->setRequest($request)->save();

        return $this
            ->httpResponse()
            ->withCreatedSuccessMessage();
    }

    public function edit(int|string $id)
    {
        $simpleSliderItem = SimpleSliderItem::query()->findOrFail($id);

        $form = SimpleSliderItemForm::createFromModel($simpleSliderItem)
            ->setUseInlineJs(true)
            ->renderForm();

        return $this
            ->httpResponse()
            ->setData([
                'title' => trans('plugins/simple-slider::simple-slider.edit_slide', ['id' => $simpleSliderItem->getKey()]),
                'content' => $form,
            ]);
    }

    public function update(int|string $id, SimpleSliderItemRequest $request)
    {
        $simpleSliderItem = SimpleSliderItem::query()->findOrFail($id);

        SimpleSliderItemForm::createFromModel($simpleSliderItem)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function destroy(int|string $id)
    {
        $simpleSliderItem = SimpleSliderItem::query()->findOrFail($id);

        return DeleteResourceAction::make($simpleSliderItem);
    }
}
