<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Facades\Html;
use App\Core\Base\Forms\FieldOptions\ContentFieldOption;
use App\Core\Base\Forms\FieldOptions\DatePickerFieldOption;
use App\Core\Base\Forms\FieldOptions\EditorFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\NumberFieldOption;
use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\Fields\DatePickerField;
use App\Core\Base\Forms\Fields\EditorField;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\MediaImagesField;
use App\Core\Base\Forms\Fields\MultiCheckListField;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TagField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\Fields\TreeCategoryField;
use App\Core\Base\Forms\FormAbstract;
use App\Core\Base\Forms\MetaBox;
use App\Plugins\Ecommerce\Enums\GlobalOptionEnum;
use App\Plugins\Ecommerce\Enums\ProductTypeEnum;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Facades\ProductCategoryHelper;
use App\Plugins\Ecommerce\Forms\Fronts\Auth\FieldOptions\TextFieldOption;
use App\Plugins\Ecommerce\Http\Requests\ProductRequest;
use App\Plugins\Ecommerce\Models\Brand;
use App\Plugins\Ecommerce\Models\GlobalOption;
use App\Plugins\Ecommerce\Models\Product;
use App\Plugins\Ecommerce\Models\ProductAttributeSet;
use App\Plugins\Ecommerce\Models\ProductCollection;
use App\Plugins\Ecommerce\Models\ProductLabel;
use App\Plugins\Ecommerce\Models\ProductVariation;
use App\Plugins\Ecommerce\Models\SpecificationTable;
use App\Plugins\Ecommerce\Models\Tax;
use App\Plugins\Ecommerce\Tables\ProductVariationTable;

class ProductForm extends FormAbstract
{
    public function setup(): void
    {
        $this->addAssets();

        $brands = Brand::query()->pluck('name', 'id')->all();

        $productCollections = ProductCollection::query()->pluck('name', 'id')->all();

        $productLabels = ProductLabel::query()->wherePublished()->pluck('name', 'id')->all();

        $productId = null;
        $selectedCategories = [];
        $tags = null;
        $totalProductVariations = 0;

        if ($this->getModel()) {

            /**
             * @var Product $product
             */
            $product = $this->getModel();

            $productId = $product->id;

            $selectedCategories = $product->categories()->pluck('category_id')->all();

            $totalProductVariations = ProductVariation::query()->where('configurable_product_id', $productId)->count();

            $tags = $product->tags()->pluck('name')->implode(',');
        }

        $this
            ->model(Product::class)
            ->setValidatorClass(ProductRequest::class)
            ->setFormOption('files', true)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add(
                'description',
                EditorField::class,
                EditorFieldOption::make()
                    ->label(trans('core/base::forms.description'))
                    ->placeholder(trans('core/base::forms.description_placeholder'))
            )
            ->add('content', EditorField::class, ContentFieldOption::make()->allowedShortcodes())
            ->add('images[]', MediaImagesField::class, [
                'label' => trans('plugins/ecommerce::products.form.image'),
                'values' => $productId ? $this->getModel()->images : [],
            ])
            ->addMetaBoxes([
                'with_related' => [
                    'title' => null,
                    'content' => Html::tag('div', '', [
                        'class' => 'wrap-relation-product',
                        'data-target' => route('products.get-relations-boxes', $productId ?: 0),
                    ]),
                    'wrap' => false,
                    'priority' => 9999,
                ],
            ])
            ->when(! EcommerceHelper::isDisabledPhysicalProduct(), function (): void {
                $this->add('product_type', 'hidden', [
                    'value' => request()->input('product_type') ?: ProductTypeEnum::PHYSICAL,
                ]);
            })
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add(
                'is_featured',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/base::forms.is_featured'))
                    ->defaultValue(false)
            )
            ->add(
                'is_new_until',
                DatePickerField::class,
                DatePickerFieldOption::make()
                    ->label(trans('plugins/ecommerce::products.form.is_new_until'))
                    ->helperText(trans('plugins/ecommerce::products.form.is_new_until_helper'))
                    ->defaultValue(null)
            )
            ->add(
                'categories[]',
                TreeCategoryField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::products.form.categories'))
                    ->choices(ProductCategoryHelper::getActiveTreeCategories())
                    ->selected(old('categories', $selectedCategories))
                    ->addAttribute('card-body-class', 'p-0')
            )
            ->when($brands, function () use ($brands): void {
                $this
                    ->add(
                        'brand_id',
                        SelectField::class,
                        SelectFieldOption::make()
                            ->label(trans('plugins/ecommerce::products.form.brand'))
                            ->choices($brands)
                            ->searchable()
                            ->emptyValue(trans('plugins/ecommerce::brands.select_brand'))
                            ->allowClear()
                    );
            })
            ->add(
                'image',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(trans('plugins/ecommerce::products.form.featured_image'))
            )
            ->when($productCollections, function () use ($productCollections): void {
                $selectedProductCollections = [];

                /**
                 * @var Product $product
                 */
                $product = $this->getModel();

                if ($product && $product->getKey()) {
                    $selectedProductCollections = $product
                        ->productCollections()
                        ->pluck('product_collection_id')
                        ->all();
                }

                $this
                    ->add('product_collections[]', MultiCheckListField::class, [
                        'label' => trans('plugins/ecommerce::products.form.collections'),
                        'choices' => $productCollections,
                        'value' => old('product_collections', $selectedProductCollections),
                    ]);
            })
            ->when($productLabels, function () use ($productLabels): void {
                $selectedProductLabels = [];

                /**
                 * @var Product $product
                 */
                $product = $this->getModel();

                if ($product && $product->getKey()) {
                    $selectedProductLabels = $product->productLabels()->pluck('product_label_id')->all();
                }

                $this
                    ->add('product_labels[]', MultiCheckListField::class, [
                        'label' => trans('plugins/ecommerce::products.form.labels'),
                        'choices' => $productLabels,
                        'value' => old('product_labels', $selectedProductLabels),
                    ]);
            })
            ->when(EcommerceHelper::isTaxEnabled(), function (): void {
                $taxes = Tax::query()->oldest('percentage')->get()->pluck('title_with_percentage', 'id')->all();

                if ($taxes) {
                    $selectedTaxes = [];

                    /**
                     * @var Product $product
                     */
                    $product = $this->getModel();

                    if ($product && $product->getKey()) {
                        $selectedTaxes = $product->taxes()->pluck('tax_id')->all();
                    }

                    $taxFieldOptions = [
                        'label' => trans('plugins/ecommerce::products.form.taxes'),
                        'choices' => $taxes,
                        'value' => old('taxes', $selectedTaxes),
                    ];

                    if (empty($selectedTaxes) && get_ecommerce_setting('default_tax_rate')) {
                        $taxFieldOptions['help_block'] = [
                            'text' => trans('plugins/ecommerce::products.form.taxes_helper', [
                                'url' => route('ecommerce.settings.taxes'),
                            ]),
                            'tag' => 'span',
                            'attr' => [
                                'class' => 'text-warning',
                            ],
                        ];
                    }

                    $this->add('taxes[]', MultiCheckListField::class, $taxFieldOptions);
                }
            })
            ->when(EcommerceHelper::isCartEnabled(), function (ProductForm $form): void {
                $form
                    ->add(
                        'minimum_order_quantity',
                        NumberField::class,
                        NumberFieldOption::make()
                            ->label(trans('plugins/ecommerce::products.form.minimum_order_quantity'))
                            ->helperText(trans('plugins/ecommerce::products.form.minimum_order_quantity_helper'))
                            ->defaultValue(0)
                    )
                    ->add(
                        'maximum_order_quantity',
                        NumberField::class,
                        NumberFieldOption::make()
                            ->label(trans('plugins/ecommerce::products.form.maximum_order_quantity'))
                            ->helperText(trans('plugins/ecommerce::products.form.maximum_order_quantity_helper'))
                            ->defaultValue(0)
                    );
            })
            ->add('tag', TagField::class, [
                'label' => trans('plugins/ecommerce::products.form.tags'),
                'value' => $tags,
                'attr' => [
                    'placeholder' => trans('plugins/ecommerce::products.form.write_some_tags'),
                    'data-url' => route('product-tag.all'),
                ],
            ])
            ->setBreakFieldPoint('status');

        if (EcommerceHelper::isProductSpecificationEnabled()) {
            $this->addMetaBox(
                MetaBox::make('product-specification-table')
                    ->title(trans('plugins/ecommerce::product-specification.specification_tables.title'))
                    ->hasTable()
                    ->attributes(['class' => 'product-specification-table'])
                    ->headerActionContent(view('plugins/ecommerce::products.partials.specification-table.header', [
                        'model' => $this->getModel(),
                        'tables' => SpecificationTable::query()->pluck('name', 'id'),
                    ])->render())
                    ->content(view('plugins/ecommerce::products.partials.specification-table.content', [
                        'model' => $this->getModel(),
                        'getTableUrl' => route('ecommerce.specification-tables.index'),
                    ])->render())
            );
        }

        if (EcommerceHelper::isEnabledProductOptions()) {
            $this
                ->addMetaBoxes([
                    'product_options_box' => [
                        'title' => trans('plugins/ecommerce::product-option.name'),
                        'content' => view('plugins/ecommerce::products.partials.product-option-form', [
                            'options' => GlobalOptionEnum::options(),
                            'globalOptions' => GlobalOption::query()->pluck('name', 'id')->all(),
                            'product' => $this->getModel(),
                            'routes' => [
                                'ajax_option_info' => route('global-option.ajaxInfo'),
                            ],
                        ]),
                        'priority' => 4,
                    ],
                ]);
        }

        $productAttributeSets = ProductAttributeSet::getAllWithSelected($productId, []);

        $this
            ->addMetaBoxes([
                'attribute-sets' => [
                    'content' => '',
                    'before_wrapper' => '<div class="d-none product-attribute-sets-url" data-url="' . route('products.product-attribute-sets') . '">',
                    'after_wrapper' => '</div>',
                    'priority' => 3,
                ],
            ]);

        if (! $totalProductVariations) {
            $this
                ->removeMetaBox('variations')
                ->addMetaBoxes([
                    'general' => [
                        'title' => trans('plugins/ecommerce::products.overview'),
                        'content' => view(
                            'plugins/ecommerce::products.partials.general',
                            [
                                'product' => $productId ? $this->getModel() : null,
                                'isVariation' => false,
                                'originalProduct' => null,
                            ]
                        ),
                        'before_wrapper' => '<div id="main-manage-product-type">',
                        'priority' => 2,
                    ],
                    'attributes' => [
                        'title' => trans('plugins/ecommerce::products.attributes'),
                        'content' => view('plugins/ecommerce::products.partials.add-product-attributes', [
                            'product' => $this->getModel(),
                            'productAttributeSets' => $productAttributeSets,
                            'addAttributeToProductUrl' => $this->getModel()->id
                                ? route('products.add-attribute-to-product', $this->getModel()->id)
                                : null,
                        ]),
                        'header_actions' => $productAttributeSets->isNotEmpty()
                            ? view('plugins/ecommerce::products.partials.product-attribute-actions')
                            : null,
                        'after_wrapper' => '</div>',
                        'priority' => 3,
                    ],
                ]);
        } elseif ($productId) {
            $productVariationTable = app(ProductVariationTable::class)
                ->setProductId($productId)
                ->setProductAttributeSets($productAttributeSets);

            /**
             * @var Product $product
             */
            $product = $this->getModel();

            if (EcommerceHelper::isEnabledSupportDigitalProducts() && $product->isTypeDigital()) {
                $productVariationTable->isDigitalProduct();
            }

            $this
                ->removeMetaBox('general')
                ->addMetaBoxes([
                    'variations' => [
                        'title' => trans('plugins/ecommerce::products.product_has_variations'),
                        'content' => view('plugins/ecommerce::products.partials.configurable', [
                            'product' => $this->getModel(),
                            'productAttributeSets' => $productAttributeSets,
                            'productVariationTable' => $productVariationTable,
                        ]),
                        'header_actions' => view(
                            'plugins/ecommerce::products.partials.product-variation-actions',
                            ['product' => $this->getModel()]
                        ),
                        'has_table' => true,
                        'before_wrapper' => '<div id="main-manage-product-type">',
                        'after_wrapper' => '</div>',
                        'priority' => 3,
                        'render' => false,
                    ],
                ])
                ->addAfter('brand_id', 'sku', TextField::class, TextFieldOption::make()->label(trans('plugins/ecommerce::products.sku')));
        }

        if ($productId && is_in_admin(true)) {
            add_filter('base_action_form_actions_extra', function () {
                return view('plugins/ecommerce::forms.duplicate-action', ['product' => $this->getModel()])->render();
            });
        }
    }

    public function addAssets(): void
    {
        Assets::addStyles('datetimepicker')
            ->addScripts([
                'moment',
                'datetimepicker',
                'input-mask',
                'jquery-ui',
            ])
            ->addStylesDirectly('vendor/core/plugins/ecommerce/css/ecommerce.css')
            ->addScriptsDirectly('vendor/core/plugins/ecommerce/js/edit-product.js');
    }
}
