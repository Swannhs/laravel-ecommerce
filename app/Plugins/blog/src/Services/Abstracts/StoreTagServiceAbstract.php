<?php

namespace App\Plugins\Blog\Services\Abstracts;

use App\Plugins\Blog\Models\Post;
use Illuminate\Http\Request;

abstract class StoreTagServiceAbstract
{
    abstract public function execute(Request $request, Post $post): void;
}
