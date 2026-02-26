<?php

namespace App\Packages\SeoHelper\Contracts\Entities;

use App\Packages\SeoHelper\Contracts\RenderableContract;

/**
 * @deprecated since 7.3.0 use ThemeSupport::renderGoogleTagManagerScript() instead.
 */
interface AnalyticsContract extends RenderableContract
{
    /**
     * Set Google Analytics code.
     *
     * @param string $code
     * @return $this
     */
    public function setGoogle($code);
}
