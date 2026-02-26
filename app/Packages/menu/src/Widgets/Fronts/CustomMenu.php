<?php

namespace App\Packages\Menu\Widgets\Fronts;

use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Supports\RepositoryHelper;
use App\Packages\Menu\Models\Menu;
use App\Packages\Menu\Models\Menu as MenuModel;
use App\Packages\Widget\AbstractWidget;
use App\Packages\Widget\Forms\WidgetForm;

class CustomMenu extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => trans('packages/menu::menu.widget_custom_menu'),
            'description' => trans('packages/menu::menu.widget_custom_menu_description'),
            'menu_id' => null,
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        $menus = MenuModel::query()
            ->wherePublished();

        $menus = RepositoryHelper::applyBeforeExecuteQuery($menus, new Menu())
            ->pluck('name', 'slug')
            ->all();

        return WidgetForm::createFromArray($this->getConfig())
            ->add('name', TextField::class, NameFieldOption::make())
            ->add(
                'menu_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('packages/menu::menu.select_menu'))
                    ->choices($menus)
                    ->searchable()
            );
    }
}
