<?php

namespace App\Plugins\Marketplace\Forms;

use App\Core\Base\Forms\FieldOptions\ContentFieldOption;
use App\Core\Base\Forms\FieldOptions\EditorFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\NumberFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\MultiCheckListField;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TagField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\Fields\TreeCategoryField;
use App\Core\Base\Forms\MetaBox;
use App\Plugins\Ecommerce\Enums\GlobalOptionEnum;
use App\Plugins\Ecommerce\Enums\ProductTypeEnum;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Facades\ProductCategoryHelper;
use App\Plugins\Ecommerce\Forms\ProductForm as BaseProductForm;
use App\Plugins\Ecommerce\Models\Brand;
use App\Plugins\Ecommerce\Models\GlobalOption;
use App\Plugins\Ecommerce\Models\Product;
use App\Plugins\Ecommerce\Models\ProductAttributeSet;
use App\Plugins\Ecommerce\Models\ProductCollection;
use App\Plugins\Ecommerce\Models\ProductLabel;
use App\Plugins\Ecommerce\Models\ProductVariation;
use App\Plugins\Ecommerce\Models\SpecificationTable;
use App\Plugins\Ecommerce\Models\Tax;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Plugins\Marketplace\Forms\Fields\CustomEditorField;
use App\Plugins\Marketplace\Forms\Fields\CustomImagesField;
use App\Plugins\Marketplace\Http\Requests\ProductRequest;
use App\Plugins\Marketplace\Tables\ProductVariationTable;

class ProductForm extends BaseProductForm
{
    public function setup(): void
    {
        $this->addAssets();

        $brands = Brand::query()->pluck('name', 'id')->all();

        $productCollections = ProductCollection::query()->pluck('name', 'id')->all();

        $productLabels = ProductLabel::query()->pluck('name', 'id')->all();

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
            ->template(MarketplaceHelper::viewPath('vendor-dashboard.forms.base'))
            ->hasFiles()
            ->setValidatorClass(ProductRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add(
                'description',
                CustomEditorField::class,
                EditorFieldOption::make()
                    ->label(trans('core/base::forms.description'))
                    ->placeholder(trans('core/base::forms.description_placeholder'))
            )
            ->add('content', CustomEditorField::class, ContentFieldOption::make()->allowedShortcodes())
            ->add('images', CustomImagesField::class, [
                'label' => trans('plugins/ecommerce::products.form.image'),
                'values' => $productId ? $this->getModel()->images : [],
            ])
            ->addMetaBoxes([
                'with_related' => [
                    'title' => null,
                    'content' => sprintf('<div class="wrap-relation-product" data-target="%s"></div>', route(
                        'marketplace.vendor.products.get-relations-boxes',
                        $productId ?: 0
                    )),
                    'wrap' => false,
                    'priority' => 9999,
                ],
            ])
            ->when(EcommerceHelper::isEnabledSupportDigitalProducts() && ! EcommerceHelper::isDisabledPhysicalProduct(), function (): void {
                $this->add('product_type', 'hidden', [
                    'value' => request()->input('product_type') ?: ProductTypeEnum::PHYSICAL,
                ]);
            })
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
                    } elseif ($defaultTaxRate = get_ecommerce_setting('default_tax_rate')) {
                        $selectedTaxes = [$defaultTaxRate];
                    }

                    $this->add('taxes[]', MultiCheckListField::class, [
                        'label' => trans('plugins/ecommerce::products.form.taxes'),
                        'choices' => $taxes,
                        'value' => old('taxes', $selectedTaxes),
                    ]);
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
                    'data-url' => route('marketplace.vendor.tags.all'),
                ],
            ])
            ->setBreakFieldPoint('categories[]');

        if (EcommerceHelper::isProductSpecificationEnabled()) {
            $this->addMetaBox(
                MetaBox::make('product-specification-table')
                    ->title(trans('plugins/ecommerce::product-specification.specification_tables.title'))
                    ->hasTable()
                    ->attributes(['class' => 'product-specification-table'])
                    ->headerActionContent(view('plugins/ecommerce::products.partials.specification-table.header', [
                        'model' => $this->getModel(),
                        'tables' => SpecificationTable::query()
                            ->pluck('name', 'id'),
                    ])->render())
                    ->content(view('plugins/ecommerce::products.partials.specification-table.content', [
                        'model' => $this->getModel(),
                        'getTableUrl' => route('marketplace.vendor.specification-tables.index'),
                    ])->render())
            );
        }

        if (EcommerceHelper::isEnabledProductOptions()) {
            $this
                ->addMetaBoxes([
                    'options' => [
                        'title' => trans('plugins/ecommerce::product-option.name'),
                        'content' => view('plugins/ecommerce::products.partials.product-option-form', [
                            'options' => GlobalOptionEnum::options(),
                            'globalOptions' => GlobalOption::query()->pluck('name', 'id')->all(),
                            'product' => $this->getModel(),
                            'routes' => [
                                'ajax_option_info' => route('marketplace.vendor.ajax-product-option-info'),
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
                    'before_wrapper' => sprintf('<div class="d-none product-attribute-sets-url" data-url="%s">', route('marketplace.vendor.products.product-attribute-sets')),
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
                                ? route('marketplace.vendor.products.add-attribute-to-product', $this->getModel()->id)
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

            if ($product->isTypeDigital()) {
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
                            MarketplaceHelper::viewPath('vendor-dashboard.products.product-variation-actions'),
                            ['product' => $this->getModel()]
                        ),
                        'has_table' => true,
                        'before_wrapper' => '<div id="main-manage-product-type">',
                        'after_wrapper' => '</div>',
                        'priority' => 3,
                        'render' => false,
                    ],
                ]);
        }
    }
}
