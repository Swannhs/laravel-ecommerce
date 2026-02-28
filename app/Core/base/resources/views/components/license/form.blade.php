<x-core::alert type="warning">
    @if ($manageLicense = auth()->guard()->user()->hasPermission('core.manage.license'))
        <div>Your license is invalid. Please activate your license!</div>
    @else
        <div>You doesn't have permission to activate the license!</div>
    @endif
</x-core::alert>

<x-core::form.text-input label="Client Username" name="buyer" id="buyer" placeholder="Your registered client username"
    :disabled="!$manageLicense">
    <x-slot:helper-text>
        Enter the username provided by your software distributor.
    </x-slot:helper-text>
</x-core::form.text-input>

<x-core::form.text-input label="License Key" name="purchase_code" id="purchase_code" :disabled="!$manageLicense"
    placeholder="Ex: A1B2C3D4-E5F6-7890">
    <x-slot:helper-text>
        Enter the license key you received after purchase.
    </x-slot:helper-text>
</x-core::form.text-input>

<x-core::form.on-off.checkbox name="license_rules_agreement" id="licenseRulesAgreement" :disabled="!$manageLicense">
    Confirm that you agree to the software license terms. Each license entitles one person for a single project domain.
</x-core::form.on-off.checkbox>

<x-core-setting::form-group>
    <x-core::button type="submit" color="primary" :disabled="!$manageLicense">
        Activate license
    </x-core::button>

    <div class="form-hint">
        <a href="{{ $licenseURL = App\Core\Base\Supports\Core::make()->getLicenseUrl() }}" target="_blank"
            class="d-inline-block mt-2"> Need reset your license?
        </a> <span class="text-body">Please log in to our <a href="{{ $licenseURL }}" target="_blank">customer license
                manager site</a> to reset your license.</span>
    </div>

</x-core-setting::form-group>

<div>
    <p>
        A purchase code (license) is only valid for One Domain. Are you using this theme on a new domain?
        Purchase a
        <a href="{{ App\Core\Base\Supports\Core::make()->getLicenseUrl('/buy') }}" target="_blank" rel="nofollow">
            new license here
        </a>
        to get a new purchase code.
    </p>
</div>