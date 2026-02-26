<?php

use App\Packages\Menu\Facades\Menu;

app()->booted(fn () => Menu::useMenuItemIconImage());
