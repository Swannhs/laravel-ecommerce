<?php

namespace App\Plugins\Blog\Forms;

use App\Core\Base\Forms\FieldOptions\ContentFieldOption;
use App\Core\Base\Forms\FieldOptions\DescriptionFieldOption;
use App\Core\Base\Forms\FieldOptions\IsFeaturedFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\RadioFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\FieldOptions\TagFieldOption;
use App\Core\Base\Forms\Fields\EditorField;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\RadioField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TagField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\Fields\TreeCategoryField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Blog\Http\Requests\PostRequest;
use App\Plugins\Blog\Models\Category;
use App\Plugins\Blog\Models\Post;
use App\Plugins\Blog\Models\Tag;

class PostForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Post::class)
            ->setValidatorClass(PostRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add('description', TextareaField::class, DescriptionFieldOption::make())
            ->add(
                'is_featured',
                OnOffField::class,
                IsFeaturedFieldOption::make()
            )
            ->add('content', EditorField::class, ContentFieldOption::make()->allowedShortcodes())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->when(get_post_formats(true), function (PostForm $form, array $postFormats): void {
                if (count($postFormats) > 1) {
                    $choices = [];

                    foreach ($postFormats as $postFormat) {
                        $choices[$postFormat[0]] = $postFormat[1];
                    }

                    $form
                        ->add(
                            'format_type',
                            RadioField::class,
                            RadioFieldOption::make()
                                ->label(trans('plugins/blog::posts.form.format_type'))
                                ->choices($choices)
                        );
                }
            })
            ->add(
                'categories[]',
                TreeCategoryField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/blog::posts.form.categories'))
                    ->choices(function () {
                        return Category::query()
                            ->wherePublished()
                            ->select(['id', 'name', 'parent_id'])
                            ->with('activeChildren')
                            ->where('parent_id', 0)
                            ->get();
                    })
                    ->when($this->getModel()->getKey(), function (SelectFieldOption $fieldOption) {
                        /**
                         * @var Post $post
                         */
                        $post = $this->getModel();

                        return $fieldOption->selected($post->categories()->pluck('category_id')->all());
                    }, function (SelectFieldOption $fieldOption) {
                        return $fieldOption
                            ->selected(
                                Category::query()
                                    ->wherePublished()
                                    ->where('is_default', 1)
                                    ->pluck('id')
                                    ->all()
                            );
                    })
            )
            ->add('image', MediaImageField::class, MediaImageFieldOption::make())
            ->add(
                'tag',
                TagField::class,
                TagFieldOption::make()
                    ->label(trans('plugins/blog::posts.form.tags'))
                    ->when($this->getModel()->getKey(), function (TagFieldOption $fieldOption) {
                        /**
                         * @var Post $post
                         */
                        $post = $this->getModel();

                        return $fieldOption
                            ->selected(
                                $post
                                    ->tags()
                                    ->select('name')
                                    ->get()
                                    ->map(fn (Tag $item) => $item->name)
                                    ->implode(',')
                            );
                    })
                    ->placeholder(trans('plugins/blog::base.write_some_tags'))
                    ->ajaxUrl(route('tags.all'))
            )
            ->setBreakFieldPoint('status');
    }
}
