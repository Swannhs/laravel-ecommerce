<?php

namespace App\Plugins\Marketplace\Http\Controllers\Fronts;

use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Marketplace\Enums\WithdrawalFeeTypeEnum;
use App\Plugins\Marketplace\Enums\WithdrawalStatusEnum;
use App\Plugins\Marketplace\Events\WithdrawalRequested;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Plugins\Marketplace\Forms\VendorWithdrawalForm;
use App\Plugins\Marketplace\Http\Requests\Fronts\VendorEditWithdrawalRequest;
use App\Plugins\Marketplace\Http\Requests\Fronts\VendorWithdrawalRequest;
use App\Plugins\Marketplace\Models\VendorInfo;
use App\Plugins\Marketplace\Models\Withdrawal;
use App\Plugins\Marketplace\Tables\VendorWithdrawalTable;
use Exception;
use Illuminate\Support\Facades\DB;
use Throwable;

class WithdrawalController extends BaseController
{
    public function index(VendorWithdrawalTable $table)
    {
        $this->pageTitle(trans('plugins/marketplace::withdrawal.name'));

        return $table->renderTable();
    }

    public function create()
    {
        $user = auth('customer')->user();
        $fee = $this->calculateWithdrawalFee($user->balance);
        $minimumWithdrawal = MarketplaceHelper::getMinimumWithdrawalAmount();

        // Calculate maximum withdrawal amount
        $feeType = MarketplaceHelper::getSetting('withdrawal_fee_type', WithdrawalFeeTypeEnum::FIXED);
        $feeValue = MarketplaceHelper::getSetting('fee_withdrawal', 0);

        if ($feeType === WithdrawalFeeTypeEnum::PERCENTAGE) {
            $maximum = $feeValue > 0 ? floor($user->balance / (1 + $feeValue / 100)) : $user->balance;
        } else {
            $maximum = $user->balance - $feeValue;
        }
        $maximum = max(0, $maximum);

        if ($maximum < $minimumWithdrawal || ! $user->bank_info) {
            return $this
                ->httpResponse()
                ->setError()
                ->setNextUrl(route('marketplace.vendor.withdrawals.index'))
                ->setMessage(trans('plugins/marketplace::withdrawal.insufficient_balance_or_no_bank_info'));
        }

        $this->pageTitle(trans('plugins/marketplace::withdrawal.withdrawal_request'));

        return VendorWithdrawalForm::create()->renderForm();
    }

    public function store(VendorWithdrawalRequest $request)
    {
        $amount = $request->input('amount');
        $fee = $this->calculateWithdrawalFee($amount);
        $total = $amount + $fee;

        /**
         * @var Customer $vendor
         */
        $vendor = auth('customer')->user();
        $vendorInfo = $vendor->vendorInfo;

        // Double check if the total amount (including fee) exceeds the balance
        if ($total > $vendorInfo->balance) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage(trans('plugins/marketplace::withdrawal.total_amount_exceeds_balance'));
        }

        try {
            DB::beginTransaction();

            /**
             * @var Withdrawal $withdrawal
             */
            $withdrawal = Withdrawal::query()->create([
                'fee' => $fee,
                'amount' => $amount,
                'customer_id' => $vendor->getKey(),
                'currency' => get_application_currency()->title,
                'bank_info' => $vendorInfo->bank_info,
                'description' => $request->input('description'),
                'current_balance' => $vendorInfo->balance,
                'payment_channel' => $vendorInfo->payout_payment_method,
            ]);

            $vendorInfo->balance -= $total;

            /**
             * @var VendorInfo $vendorInfo
             */
            $vendorInfo->save();

            event(new WithdrawalRequested($vendor, $withdrawal));

            DB::commit();
        } catch (Throwable | Exception $th) {
            DB::rollBack();

            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($th->getMessage());
        }

        return $this
            ->httpResponse()
            ->setNextUrl(route('marketplace.vendor.withdrawals.show', $withdrawal->id))
            ->setMessage(trans('plugins/marketplace::withdrawal.created_success_message'));
    }

    protected function calculateWithdrawalFee(float $amount): float
    {
        $fee = MarketplaceHelper::getSetting('fee_withdrawal', 0);
        $feeType = MarketplaceHelper::getSetting('withdrawal_fee_type', WithdrawalFeeTypeEnum::FIXED);

        if ($feeType === WithdrawalFeeTypeEnum::PERCENTAGE) {
            return $amount * $fee / 100;
        }

        return $fee;
    }

    public function edit(int|string $id)
    {
        $withdrawal = Withdrawal::query()
            ->where([
                'id' => $id,
                'customer_id' => auth('customer')->id(),
                'status' => WithdrawalStatusEnum::PENDING,
            ])
            ->firstOrFail();

        $this->pageTitle(trans('plugins/marketplace::withdrawal.update_withdrawal_request', ['id' => $id]));

        return VendorWithdrawalForm::createFromModel($withdrawal)
            ->setUrl(route('marketplace.vendor.withdrawals.edit', $withdrawal->getKey()))
            ->renderForm();
    }

    public function update(int|string $id, VendorEditWithdrawalRequest $request)
    {
        $withdrawal = Withdrawal::query()
            ->where([
                'id' => $id,
                'customer_id' => auth('customer')->id(),
                'status' => WithdrawalStatusEnum::PENDING,
            ])
            ->firstOrFail();

        $status = WithdrawalStatusEnum::PENDING;
        if ($request->input('cancel')) {
            $status = WithdrawalStatusEnum::CANCELED;
        }

        $withdrawal->fill([
            'status' => $status,
            'description' => $request->input('description'),
        ]);

        $withdrawal->save();

        if ($status === WithdrawalStatusEnum::CANCELED) {
            return $this
                ->httpResponse()
                ->setPreviousUrl(route('marketplace.vendor.withdrawals.index'))
                ->setNextUrl(route('marketplace.vendor.withdrawals.show', $withdrawal->getKey()))
                ->withUpdatedSuccessMessage();
        }

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('marketplace.vendor.withdrawals.index'))
            ->withUpdatedSuccessMessage();
    }

    public function show(int|string $id)
    {
        $withdrawal = Withdrawal::query()
            ->where('id', $id)
            ->where('customer_id', auth('customer')->id())
            ->firstOrFail();

        $this->pageTitle(trans('plugins/marketplace::withdrawal.view_withdrawal_request', ['id' => $id]));

        return VendorWithdrawalForm::createFromModel($withdrawal)
            ->setUrl(route('marketplace.vendor.withdrawals.edit', $withdrawal->getKey()))
            ->renderForm();
    }
}
