<?php

namespace App\Packages\Menu\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Packages\Menu\Http\Requests\MenuRequest;
use App\Packages\Menu\Models\Menu;

class MenuForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addStyles('jquery-nestable')
            ->addScripts('jquery-nestable')
            ->addScriptsDirectly('vendor/core/packages/menu/js/menu.js')
            ->addStylesDirectly('vendor/core/packages/menu/css/menu.css');

        $this
            ->model(Menu::class)
            ->setFormOption('class', 'form-save-menu')
            ->setValidatorClass(MenuRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required()->maxLength(120))
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->addMetaBoxes([
                'structure' => [
                    'wrap' => false,
                    'content' => function () {
                        /**
                         * @var Menu $menu
                         */
                        $menu = $this->getModel();

                        return view('packages/menu::menu-structure', [
                            'menu' => $menu,
                            'locations' => $menu->getKey() ? $menu->locations()->pluck('location')->all() : [],
                        ])->render();
                    },
                ],
            ])
            ->setBreakFieldPoint('status');
    }
}
