<?php

namespace App\Plugins\Marketplace\Http\Controllers\Fronts;

use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Plugins\Marketplace\Models\Message;
use App\Plugins\Marketplace\Tables\Fronts\MessageTable;

class MessageController extends BaseController
{
    public function index(MessageTable $messageTable)
    {
        abort_unless(MarketplaceHelper::isEnabledMessagingSystem(), 404);

        $this->pageTitle(trans('plugins/marketplace::message.name'));

        return $messageTable->renderTable();
    }

    public function show(string $id)
    {
        abort_unless(MarketplaceHelper::isEnabledMessagingSystem(), 404);

        $message = Message::query()
            ->where('store_id', auth('customer')->user()->store?->id)
            ->with(['store', 'customer'])
            ->findOrFail($id);

        $this->pageTitle(trans('plugins/marketplace::message.viewing_message', ['id' => $message->getKey()]));

        return MarketplaceHelper::view('vendor-dashboard.messages.show', compact('message'));
    }

    public function destroy(string $id)
    {
        abort_unless(MarketplaceHelper::isEnabledMessagingSystem(), 404);

        $message = Message::query()
            ->where('store_id', auth('customer')->user()->store?->id)
            ->findOrFail($id);

        return DeleteResourceAction::make($message);
    }
}
