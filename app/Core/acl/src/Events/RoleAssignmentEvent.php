<?php

namespace App\Core\ACL\Events;

use App\Core\ACL\Models\Role;
use App\Core\ACL\Models\User;
use App\Core\Base\Events\Event;
use Illuminate\Queue\SerializesModels;

class RoleAssignmentEvent extends Event
{
    use SerializesModels;

    public function __construct(public Role $role, public User $user)
    {
    }
}
