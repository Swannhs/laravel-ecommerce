<?php

namespace App\Core\Media\Events;

use App\Core\Media\Models\MediaFolder;
use Illuminate\Foundation\Events\Dispatchable;

class MediaFolderRenamed
{
    use Dispatchable;

    public function __construct(public MediaFolder $folder)
    {
    }
}
