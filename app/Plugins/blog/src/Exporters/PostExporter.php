<?php

namespace App\Plugins\Blog\Exporters;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Plugins\Blog\Models\Post;
use App\Plugins\Blog\Supports\PostFormat;
use App\Packages\DataSynchronize\Exporter\ExportColumn;
use App\Packages\DataSynchronize\Exporter\ExportCounter;
use App\Packages\DataSynchronize\Exporter\Exporter;
use App\Core\Media\Facades\RvMedia;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class PostExporter extends Exporter
{
    protected ?int $limit = null;

    protected ?string $status = null;

    protected ?bool $isFeatured = null;

    protected ?string $startDate = null;

    protected ?string $endDate = null;

    protected ?int $categoryId = null;

    public function setLimit(?int $limit): static
    {
        $this->limit = $limit;

        return $this;
    }

    public function setStatus(?string $status): static
    {
        $this->status = $status;

        return $this;
    }

    public function setIsFeatured(?bool $isFeatured): static
    {
        $this->isFeatured = $isFeatured;

        return $this;
    }

    public function setDateRange(?string $startDate, ?string $endDate): static
    {
        $this->startDate = $startDate;
        $this->endDate = $endDate;

        return $this;
    }

    public function setCategoryId(?int $categoryId): static
    {
        $this->categoryId = $categoryId;

        return $this;
    }
    public function getLabel(): string
    {
        return trans('plugins/blog::posts.posts');
    }

    public function columns(): array
    {
        return [
            ExportColumn::make('name'),
            ExportColumn::make('description'),
            ExportColumn::make('content'),
            ExportColumn::make('is_featured')
                ->boolean(),
            ExportColumn::make('format_type')
                ->dropdown(array_keys(PostFormat::getPostFormats(true))),
            ExportColumn::make('image'),
            ExportColumn::make('views'),
            ExportColumn::make('slug'),
            ExportColumn::make('url')
                ->label('URL'),
            ExportColumn::make('status')
                ->dropdown(BaseStatusEnum::values()),
            ExportColumn::make('categories'),
            ExportColumn::make('tags'),
        ];
    }

    protected function applyFilters(Builder $query): void
    {
        if ($this->status) {
            $query->where('status', $this->status);
        }

        if ($this->isFeatured !== null) {
            $query->where('is_featured', $this->isFeatured);
        }

        if ($this->startDate) {
            $query->whereDate('created_at', '>=', Carbon::parse($this->startDate));
        }

        if ($this->endDate) {
            $query->whereDate('created_at', '<=', Carbon::parse($this->endDate));
        }

        if ($this->categoryId) {
            $query->whereHas('categories', function ($q): void {
                $q->where('categories.id', $this->categoryId);
            });
        }

        if ($this->limit) {
            $query->latest()->limit($this->limit);
        } else {
            $query->oldest();
        }
    }

    public function counters(): array
    {
        $query = Post::query();

        $this->applyFilters($query);

        return [
            ExportCounter::make()
                ->label(trans('plugins/blog::posts.export.total'))
                ->value($query->count()),
        ];
    }

    public function hasDataToExport(): bool
    {
        return Post::query()->exists();
    }

    public function collection(): Collection
    {
        $query = Post::query()
            ->with(['categories', 'tags', 'slugable']);

        $this->applyFilters($query);

        return $query->get()
            ->transform(fn (Post $post) => [
                ...$post->toArray(),
                'slug' => $post->slugable->key,
                'url' => $post->url,
                'image' => RvMedia::getImageUrl($post->image),
                'categories' => $post->categories->pluck('name')->implode(', '),
                'tags' => $post->tags->pluck('name')->implode(', '),
            ]);
    }

    protected function getView(): string
    {
        return 'plugins/blog::posts.export';
    }
}
