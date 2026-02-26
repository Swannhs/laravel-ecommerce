<?php

namespace App\Core\Table\BulkActions;

use App\Core\Base\Contracts\BaseModel;
use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Exceptions\DisabledInDemoModeException;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Core\Table\Abstracts\TableBulkActionAbstract;
use Illuminate\Database\Eloquent\Model;

class DeleteBulkAction extends TableBulkActionAbstract
{
    protected bool $silent = false;

    public function __construct()
    {
        $this
            ->label(trans('core/table::table.delete'))
            ->confirmationModalButton(trans('core/table::table.delete'))
            ->beforeDispatch(function (): void {
                if (BaseHelper::hasDemoModeEnabled()) {
                    throw new DisabledInDemoModeException();
                }
            });
    }

    public function silent(bool $silent = true): static
    {
        $this->silent = $silent;

        return $this;
    }

    public function dispatch(BaseModel|Model $model, array $ids): BaseHttpResponse
    {
        $model->newQuery()->whereKey($ids)->each(function (BaseModel|Model $item): void {
            $item->delete();

            if (! $this->silent) {
                DeletedContentEvent::dispatch($item::class, request(), $item);
            }
        });

        return BaseHttpResponse::make()
            ->withDeletedSuccessMessage();
    }
}
