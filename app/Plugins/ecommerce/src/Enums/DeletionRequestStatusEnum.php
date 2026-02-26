<?php

namespace App\Plugins\Ecommerce\Enums;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

class DeletionRequestStatusEnum extends Enum
{
    public const WAITING_FOR_CONFIRMATION = 'waiting_for_confirmation';

    public const CONFIRMED = 'confirmed';

    public const CANCELED = 'canceled';

    protected static $langPath = 'plugins/ecommerce::account-deletion.statuses';

    public function toHtml(): HtmlString|string
    {
        $color = match ($this->value) {
            self::WAITING_FOR_CONFIRMATION => 'warning',
            self::CONFIRMED => 'success',
            self::CANCELED => 'danger',
            default => 'secondary',
        };

        return BaseHelper::renderBadge($this->label(), $color);
    }
}
