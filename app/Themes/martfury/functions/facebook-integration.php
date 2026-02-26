<?php

use App\Packages\Theme\Facades\Theme;

app()->booted(fn () => Theme::registerFacebookIntegration());
