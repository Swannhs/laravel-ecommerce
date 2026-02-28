<?php

namespace App\Core\Base\Commands;

use App\Core\Base\Commands\Traits\ValidateCommandInput;
use App\Core\Base\Exceptions\LicenseIsAlreadyActivatedException;
use App\Core\Base\Supports\Core;
use App\Core\Setting\Facades\Setting;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Validator;

use function Laravel\Prompts\text;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Input\InputOption;
use Throwable;

#[AsCommand('cms:license:activate', 'Activate license')]
class ActivateLicenseCommand extends Command
{
    use ValidateCommandInput;

    public function __construct(protected Core $core)
    {
        parent::__construct();
    }

    public function handle(): int
    {
        if ($this->option('username') && $this->option('key')) {
            $username = $this->option('username');
            $purchasedCode = $this->option('key');
            $validator = Validator::make(
                [
                    'username' => $username,
                    'key' => $purchasedCode,
                ],
                [
                    'username' => ['required', 'string'],
                    'key' => ['required', 'string'],
                ]
            )->stopOnFirstFailure();

            if ($validator->fails()) {
                $this->components->error($validator->messages()->first());

                return self::FAILURE;
            }
        } else {
            $username = text(
                label: 'Client username',
                required: true,
            );

            $purchasedCode = text(
                label: 'License Key',
                required: true,
            );
        }

        try {
            return $this->performUpdate($purchasedCode, $username);
        } catch (LicenseIsAlreadyActivatedException) {
            $this->core->revokeLicense($purchasedCode, $username);

            return tap(
                $this->performUpdate($purchasedCode, $username),
                fn() => $this->components->warn('Your license on the previous domain has been revoked!')
            );
        } catch (Throwable $exception) {
            $this->components->error($exception->getMessage());

            return self::FAILURE;
        }
    }

    protected function performUpdate(string $purchasedCode, string $username): int
    {
        $status = $this->core->activateLicense($purchasedCode, $username);

        if (!$status) {
            $this->components->error('This license is invalid.');

            return self::FAILURE;
        }

        Setting::forceSet('licensed_to', $username)->save();

        $this->components->info('This license has been activated successfully.');

        return self::SUCCESS;
    }

    protected function configure(): void
    {
        $this->addOption('username', null, InputOption::VALUE_REQUIRED, 'The client username');
        $this->addOption('key', null, InputOption::VALUE_REQUIRED, 'The license key');
    }
}
