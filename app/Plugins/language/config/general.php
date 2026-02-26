<?php

use App\Packages\Menu\Models\Menu;
use App\Packages\Menu\Models\MenuNode;
use App\Packages\Page\Models\Page;

return [
    'supported' => [
        Page::class,
        Menu::class,
        MenuNode::class,
    ],
];
