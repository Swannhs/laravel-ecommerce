<?php

namespace App\Packages\Page\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use App\Packages\Page\Models\Page;
use App\Packages\Page\Services\PageService;
use App\Packages\Slug\Facades\SlugHelper;
use App\Packages\Theme\Events\RenderingSingleEvent;
use App\Packages\Theme\Facades\Theme;

class PublicController extends BaseController
{
    public function getPage(string $slug, PageService $pageService)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Page::class));

        abort_unless($slug, 404);

        $data = $pageService->handleFrontRoutes($slug);

        if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            return redirect()->to(url(SlugHelper::getPrefix(Page::class) . '/' . $data['slug']));
        }

        event(new RenderingSingleEvent($slug));

        return Theme::scope($data['view'], $data['data'], $data['default_view'])->render();
    }
}
