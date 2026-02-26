<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Customers;

use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Events\UpdatedContentEvent;
use App\Core\Base\Facades\Assets;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Supports\Breadcrumb;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Forms\CustomerForm;
use App\Plugins\Ecommerce\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Http\Requests\AddCustomerWhenCreateOrderRequest;
use App\Plugins\Ecommerce\Http\Requests\CustomerCreateRequest;
use App\Plugins\Ecommerce\Http\Requests\CustomerEditRequest;
use App\Plugins\Ecommerce\Http\Requests\CustomerUpdateEmailRequest;
use App\Plugins\Ecommerce\Http\Resources\CustomerAddressResource;
use App\Plugins\Ecommerce\Models\Address;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Ecommerce\Tables\CustomerReviewTable;
use App\Plugins\Ecommerce\Tables\CustomerTable;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class CustomerController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/ecommerce::customer.name'), route('customers.index'));
    }

    public function index(CustomerTable $dataTable)
    {
        $this->pageTitle(trans('plugins/ecommerce::customer.name'));

        return $dataTable->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/ecommerce::customer.create'));

        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/customer.js');

        return CustomerForm::create()->remove('is_change_password')->renderForm();
    }

    public function store(CustomerCreateRequest $request)
    {
        $customer = new Customer();
        $customer->fill($request->input());
        $customer->confirmed_at = Carbon::now();
        $customer->password = Hash::make($request->input('password'));

        if ($dob = $request->input('dob')) {
            $customer->dob = BaseHelper::parseDate($dob);
        }

        $customer->save();

        event(new CreatedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('customers.index'))
            ->setNextUrl(route('customers.edit', $customer->getKey()))
            ->withCreatedSuccessMessage();
    }

    public function edit(Customer $customer)
    {
        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/customer.js');

        $this->pageTitle(trans('plugins/ecommerce::customer.edit', ['name' => $customer->name]));

        $customer->password = null;

        return CustomerForm::createFromModel($customer)->setValidatorClass(CustomerEditRequest::class)->renderForm();
    }

    public function update(Customer $customer, CustomerEditRequest $request)
    {
        $customer->fill($request->except('password'));

        if ($request->input('is_change_password') == 1) {
            $customer->password = Hash::make($request->input('password'));
        }

        if ($dob = $request->input('dob')) {
            $customer->dob = BaseHelper::parseDate($dob);
        }

        $customer->save();

        event(new UpdatedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('customers.index'))
            ->withUpdatedSuccessMessage();
    }

    public function destroy(Customer $customer)
    {
        return DeleteResourceAction::make($customer);
    }

    public function verifyEmail(int|string $id, Request $request)
    {
        $customer = Customer::query()
            ->where([
                'id' => $id,
                'confirmed_at' => null,
            ])->firstOrFail();

        $customer->confirmed_at = Carbon::now();
        $customer->save();

        event(new UpdatedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('customers.index'))
            ->withUpdatedSuccessMessage();
    }

    public function resendVerificationEmail(int|string $id)
    {
        $customer = Customer::query()->findOrFail($id);

        if ($customer->confirmed_at) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage(trans('plugins/ecommerce::customer.email_already_verified'));
        }

        $customer->sendEmailVerificationNotification();

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/ecommerce::customer.verification_email_sent'));
    }

    public function getListCustomerForSelect()
    {
        $customers = Customer::query()
            ->select(['id', 'name'])
            ->get()
            ->all();

        return $this
            ->httpResponse()
            ->setData($customers);
    }

    public function getListCustomerForSearch(Request $request)
    {
        $customers = Customer::query()
            ->where('name', 'LIKE', '%' . $request->input('keyword') . '%')
            ->simplePaginate(5);

        foreach ($customers as &$customer) {
            $customer->avatar_url = (string) $customer->avatar_url;
        }

        return $this
            ->httpResponse()->setData($customers);
    }

    public function postUpdateEmail($id, CustomerUpdateEmailRequest $request)
    {
        $customer = Customer::query()->findOrFail($id);

        $customer->email = $request->input('email');
        $customer->save();

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function getCustomerAddresses($id)
    {
        $addresses = Address::query()->where('customer_id', $id)->get();

        return $this
            ->httpResponse()
            ->setData(CustomerAddressResource::collection($addresses));
    }

    public function getCustomerOrderNumbers($id)
    {
        /**
         * @var Customer $customer
         */
        $customer = Customer::query()->find($id);

        if (! $customer) {
            return $this
                ->httpResponse()
                ->setData(0);
        }

        return $this
            ->httpResponse()
            ->setData($customer->completedOrders()->count());
    }

    public function postCreateCustomerWhenCreatingOrder(AddCustomerWhenCreateOrderRequest $request)
    {
        $request->merge(['password' => Hash::make(Str::random(36))]);
        $customer = Customer::query()->create($request->input());
        $customer->avatar = (string) $customer->avatar_url;

        event(new CreatedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

        $request->merge([
            'customer_id' => $customer->id,
            'is_default' => true,
        ]);

        $address = Address::query()->create($request->input());

        if (! EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation()) {
            $address->country = $address->country_name;
            $address->state = $address->state_name;
            $address->city = $address->city_name;
        }

        return $this
            ->httpResponse()
            ->setData(compact('address', 'customer'))
            ->withCreatedSuccessMessage();
    }

    public function ajaxReviews(int|string $id, CustomerReviewTable $customerReviewTable)
    {
        return $customerReviewTable->customerId($id)->renderTable();
    }

    public function view($id)
    {
        $customer = Customer::query()->findOrFail($id);

        $this->pageTitle(trans('plugins/ecommerce::customer.view', ['name' => $customer->name]));

        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/customer.js');

        $totalSpent = $customer->completedOrders()->sum('amount');
        $totalOrders = $customer->finishedOrders()->count();
        $completedOrders = $customer->completedOrders()->count();
        $totalProducts = $customer->completedOrders()
            ->withCount('products')
            ->get()
            ->sum('products_count');

        return view('plugins/ecommerce::customers.view', compact('customer', 'totalSpent', 'totalOrders', 'completedOrders', 'totalProducts'));
    }
}
