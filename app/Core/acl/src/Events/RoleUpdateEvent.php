<?php

namespace App\Core\ACL\Events;

use App\Core\ACL\Models\Role;
use App\Core\Base\Events\Event;
use Illuminate\Queue\SerializesModels;

class RoleUpdateEvent extends Event
{
    use SerializesModels;

    public function __construct(public Role $role)
    {
    }
}
