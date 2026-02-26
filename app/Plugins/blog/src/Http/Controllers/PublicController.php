<?php

namespace App\Plugins\Blog\Http\Controllers;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Blog\Repositories\Interfaces\PostInterface;
use App\Packages\SeoHelper\Facades\SeoHelper;
use App\Packages\Theme\Facades\Theme;
use Illuminate\Http\Request;

class PublicController extends BaseController
{
    public function getSearch(Request $request, PostInterface $postRepository)
    {
        $query = BaseHelper::stringify($request->input('q'));

        $title = trans('plugins/blog::base.search_result_for', compact('query'));

        SeoHelper::setTitle($title)
            ->setDescription($title);

        $posts = $postRepository->getSearch($query, 0, (int) theme_option('number_of_posts_in_a_category', 12));

        Theme::breadcrumb()->add($title, route('public.search'));

        return Theme::scope('search', compact('posts'))
            ->render();
    }
}
