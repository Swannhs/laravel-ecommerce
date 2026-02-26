<?php

namespace App\Plugins\Location\Http\Controllers;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Http\Controllers\BaseController;
use App\Core\Base\Supports\Breadcrumb;
use App\Plugins\Location\Forms\StateForm;
use App\Plugins\Location\Http\Requests\StateRequest;
use App\Plugins\Location\Http\Resources\StateResource;
use App\Plugins\Location\Models\State;
use App\Plugins\Location\Tables\StateTable;
use Illuminate\Http\Request;

class StateController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/location::location.name'))
            ->add(trans('plugins/location::state.name'), route('state.index'));
    }

    public function index(StateTable $table)
    {
        $this->pageTitle(trans('plugins/location::state.name'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/location::state.create'));

        return StateForm::create()->renderForm();
    }

    public function store(StateRequest $request)
    {
        $form = StateForm::create()->setRequest($request);
        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('state.index')
            ->setNextRoute('state.edit', $form->getModel()->getKey())
            ->withCreatedSuccessMessage();
    }

    public function edit(State $state)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $state->name]));

        return StateForm::createFromModel($state)->renderForm();
    }

    public function update(State $state, StateRequest $request)
    {
        StateForm::createFromModel($state)->setRequest($request)->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('state.index')
            ->withUpdatedSuccessMessage();
    }

    public function destroy(State $state)
    {
        return DeleteResourceAction::make($state);
    }

    public function getList(Request $request)
    {
        $keyword = BaseHelper::stringify($request->input('q'));

        if (! $keyword) {
            return $this
                ->httpResponse()
                ->setData([]);
        }

        $data = State::query()
            ->where('name', 'LIKE', '%' . $keyword . '%')
            ->select(['id', 'name'])
            ->take(10)
            ->oldest('order')
            ->oldest('name')
            ->get();

        $data->prepend(new State(['id' => 0, 'name' => trans('plugins/location::city.select_state')]));

        return $this
            ->httpResponse()
            ->setData(StateResource::collection($data));
    }

    public function ajaxGetStates(Request $request)
    {
        $data = State::query()
            ->select(['id', 'name'])
            ->wherePublished()
            ->orderBy('order')
            ->orderBy('name');

        $countryId = $request->input('country_id');

        if ($countryId && $countryId != 'null') {
            $data = $data
                ->whereHas('country', function ($query) use ($countryId): void {
                    $query
                        ->where('id', $countryId)
                        ->orWhere('code', $countryId);
                });
        }

        $data = $data->get();

        $data->prepend(new State(['id' => 0, 'name' => trans('plugins/location::city.select_state')]));

        return $this
            ->httpResponse()
            ->setData(StateResource::collection($data));
    }
}
