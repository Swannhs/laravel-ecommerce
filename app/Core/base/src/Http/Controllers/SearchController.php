<?php

namespace App\Core\Base\Http\Controllers;

use App\Core\Base\Contracts\GlobalSearchableManager;
use App\Core\Base\Http\Responses\BaseHttpResponse;
use Illuminate\Http\Request;

class SearchController extends BaseController
{
    public function __invoke(GlobalSearchableManager $manager, Request $request): BaseHttpResponse
    {
        $request->validate(['keyword' => ['nullable', 'string', 'max:1024']]);

        $results = $manager->search((string) $request->input('keyword'));

        return $this
            ->httpResponse()
            ->setData(view('core/base::global-search.index', compact('results'))->render());
    }
}
