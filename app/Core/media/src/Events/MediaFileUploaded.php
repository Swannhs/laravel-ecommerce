<?php

namespace App\Core\Media\Events;

use App\Core\Media\Models\MediaFile;
use Illuminate\Foundation\Events\Dispatchable;

class MediaFileUploaded
{
    use Dispatchable;

    public function __construct(public MediaFile $file)
    {
    }
}
