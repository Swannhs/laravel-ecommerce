<?php

namespace App\Plugins\Marketplace\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Marketplace\Enums\WithdrawalStatusEnum;
use App\Plugins\Marketplace\Models\Withdrawal;
use App\Plugins\Marketplace\Services\GeneratePayoutInvoiceService;
use Illuminate\Http\Request;

class WithdrawalInvoiceController extends BaseController
{
    public function __invoke(
        Withdrawal $withdrawal,
        Request $request,
        GeneratePayoutInvoiceService $generateWithdrawalInvoiceService
    ) {
        abort_if($withdrawal->status != WithdrawalStatusEnum::COMPLETED, 404);

        $generateWithdrawalInvoiceService->withdrawal($withdrawal->loadMissing('customer'));

        if ($request->input('type') === 'print') {
            return $generateWithdrawalInvoiceService->stream();
        }

        return $generateWithdrawalInvoiceService->download();
    }
}
