<?php

namespace App\Plugins\Blog\Http\Controllers;

use App\Core\ACL\Models\User;
use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FormAbstract;
use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Http\Controllers\BaseController;
use App\Core\Base\Http\Requests\UpdateTreeCategoryRequest;
use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Core\Base\Supports\Breadcrumb;
use App\Core\Base\Supports\RepositoryHelper;
use App\Plugins\Blog\Forms\CategoryForm;
use App\Plugins\Blog\Http\Requests\CategoryRequest;
use App\Plugins\Blog\Models\Category;
use App\Plugins\Blog\Tables\CategoryTable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CategoryController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/blog::base.menu_name'))
            ->add(trans('plugins/blog::categories.menu'), route('categories.index'));
    }

    public function index(Request $request, CategoryTable $dataTable)
    {
        $this->pageTitle(trans('plugins/blog::categories.menu'));

        // Handle table view
        if ($request->get('as') === 'table') {
            return $dataTable->renderTable();
        }

        $categories = Category::query()
            ->latest('is_default')
            ->oldest('order')->oldest()
            ->with('slugable');

        $categories = RepositoryHelper::applyBeforeExecuteQuery($categories, new Category())->get();

        if ($request->ajax()) {
            $data = view('core/base::forms.partials.tree-categories', $this->getOptions(compact('categories')))
                ->render();

            return $this
                ->httpResponse()
                ->setData($data);
        }

        Assets::addStylesDirectly('vendor/core/core/base/css/tree-category.css')
            ->addScriptsDirectly('vendor/core/core/base/js/tree-category.js');

        $form = CategoryForm::create(['template' => 'plugins/blog::categories.form-tree-category']);
        $form = $this->setFormOptions($form, null, compact('categories'));
        $form->setUrl(route('categories.create'));

        return $form->renderForm();
    }

    public function create(Request $request)
    {
        $this->pageTitle(trans('plugins/blog::categories.create'));

        if ($request->ajax()) {
            return $this
                ->httpResponse()
                ->setData($this->getForm());
        }

        return CategoryForm::create()->renderForm();
    }

    public function store(CategoryRequest $request)
    {
        if ($request->input('is_default')) {
            Category::query()->where('id', '>', 0)->update(['is_default' => 0]);
        }

        $form = CategoryForm::create();
        $form
            ->saving(function (CategoryForm $form) use ($request): void {
                $form
                    ->getModel()
                    ->fill([...$request->validated(),
                        'author_id' => Auth::guard()->id(),
                        'author_type' => User::class,
                    ])
                    ->save();
            });

        $response = $this->httpResponse();

        /**
         * @var Category $category
         */
        $category = $form->getModel();

        if ($request->ajax()) {
            if ($response->isSaving()) {
                $form = $this->getForm();
            } else {
                $form = $this->getForm($category);
            }

            $response->setData([
                'model' => $category,
                'form' => $form,
            ]);
        }

        return $response
            ->setPreviousRoute('categories.index')
            ->setNextRoute('categories.edit', $category->getKey())
            ->withCreatedSuccessMessage();
    }

    public function edit(Category $category, Request $request)
    {
        if ($request->ajax()) {
            return $this
                ->httpResponse()
                ->setData($this->getForm($category));
        }

        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $category->name]));

        return CategoryForm::createFromModel($category)
            ->setUrl(route('categories.edit', $category->getKey()))
            ->renderForm();
    }

    public function update(Category $category, CategoryRequest $request)
    {
        if ($request->input('is_default')) {
            Category::query()->where('id', '!=', $category->getKey())->update(['is_default' => 0]);
        }

        CategoryForm::createFromModel($category)->save();

        $response = $this->httpResponse();

        if ($request->ajax()) {
            if ($response->isSaving()) {
                $form = $this->getForm();
            } else {
                $form = $this->getForm($category);
            }

            $response->setData([
                'model' => $category,
                'form' => $form,
            ]);
        }

        return $response
            ->setPreviousRoute('categories.index')
            ->withUpdatedSuccessMessage();
    }

    public function destroy(Category $category)
    {
        return DeleteResourceAction::make($category);
    }

    public function updateTree(UpdateTreeCategoryRequest $request): BaseHttpResponse
    {
        Category::updateTree($request->validated('data'));

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function getSearch(Request $request)
    {
        $term = $request->input('search') ?: $request->input('q');

        $categories = Category::query()
            ->select(['id', 'name'])
            ->where('name', 'LIKE', '%' . $term . '%')
            ->paginate(10);

        $data = $categories->map(function ($category) {
            return [
                'id' => $category->id,
                'text' => $category->name,
            ];
        });

        return $this
            ->httpResponse()
            ->setData($data)->toApiResponse();
    }

    protected function getForm(?Category $model = null): string
    {
        $options = ['template' => 'core/base::forms.form-no-wrap'];

        if ($model) {
            $options['model'] = $model;
        }

        $form = CategoryForm::create($options);

        $form = $this->setFormOptions($form, $model);

        if (! $model) {
            $form->setUrl(route('categories.create'));
        } else {
            $form->setUrl(route('categories.edit', $model->getKey()));
        }

        return $form->renderForm();
    }

    protected function setFormOptions(FormAbstract $form, ?Category $model = null, array $options = []): FormAbstract
    {
        if (! $model) {
            $form->setUrl(route('categories.create'));
        }

        if (! Auth::guard()->user()->hasPermission('categories.create') && ! $model) {
            $class = $form->getFormOption('class');
            $form->setFormOption('class', $class . ' d-none');
        }

        $form->setFormOptions($this->getOptions($options));

        return $form;
    }

    protected function getOptions(array $options = []): array
    {
        return array_merge([
            'canCreate' => Auth::guard()->user()->hasPermission('categories.create'),
            'canEdit' => Auth::guard()->user()->hasPermission('categories.edit'),
            'canDelete' => Auth::guard()->user()->hasPermission('categories.destroy'),
            'createRoute' => 'categories.create',
            'editRoute' => 'categories.edit',
            'deleteRoute' => 'categories.destroy',
            'updateTreeRoute' => 'categories.update-tree',
        ], $options);
    }
}
