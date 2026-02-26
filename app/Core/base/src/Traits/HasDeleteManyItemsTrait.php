<?php

namespace App\Core\Base\Traits;

use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Core\Base\Models\BaseModel;
use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Http\Request;

/**
 * @deprecated since v6.8.0
 */
trait HasDeleteManyItemsTrait
{
    protected function executeDeleteItems(
        Request $request,
        BaseHttpResponse $response,
        RepositoryInterface|BaseModel $repository
    ): BaseHttpResponse {
        $ids = $request->input('ids');

        if (empty($ids)) {
            return $response
                ->setError()
                ->setMessage(trans('core/base::notices.no_select'));
        }

        foreach ($ids as $id) {
            $item = $repository->findOrFail($id);
            if (! $item) {
                continue;
            }

            $item->delete();

            DeletedContentEvent::dispatch($item::class, $request, $item);
        }

        return $response->withDeletedSuccessMessage();
    }
}
