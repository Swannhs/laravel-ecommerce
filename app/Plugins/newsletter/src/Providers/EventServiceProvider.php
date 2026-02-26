<?php

namespace App\Plugins\Newsletter\Providers;

use App\Plugins\Newsletter\Events\SubscribeNewsletterEvent;
use App\Plugins\Newsletter\Events\UnsubscribeNewsletterEvent;
use App\Plugins\Newsletter\Listeners\AddSubscriberToMailchimpContactListListener;
use App\Plugins\Newsletter\Listeners\AddSubscriberToSendGridContactListListener;
use App\Plugins\Newsletter\Listeners\RemoveSubscriberToMailchimpContactListListener;
use App\Plugins\Newsletter\Listeners\SendEmailNotificationAboutNewSubscriberListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        SubscribeNewsletterEvent::class => [
            SendEmailNotificationAboutNewSubscriberListener::class,
            AddSubscriberToMailchimpContactListListener::class,
            AddSubscriberToSendGridContactListListener::class,
        ],
        UnsubscribeNewsletterEvent::class => [
            RemoveSubscriberToMailchimpContactListListener::class,
        ],
    ];
}
