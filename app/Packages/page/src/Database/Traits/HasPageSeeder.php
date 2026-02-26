<?php

namespace App\Packages\Page\Database\Traits;

use App\Core\ACL\Models\User;
use App\Packages\Page\Models\Page;
use App\Packages\Shortcode\Facades\Shortcode;
use App\Packages\Slug\Facades\SlugHelper;
use Illuminate\Support\Arr;

trait HasPageSeeder
{
    protected function getPageId(string $name): int|string|null
    {
        return Page::query()->where('name', $name)->value('id');
    }

    protected function createPages(array $pages): void
    {
        $userId = User::query()->value('id');

        foreach ($pages as $item) {
            $item['user_id'] = $userId ?: 0;

            /**
             * @var Page $page
             */
            $page = Page::query()->create(Arr::except($item, 'metadata'));

            $this->createMetadata($page, $item);

            SlugHelper::createSlug($page);
        }
    }

    protected function truncatePages(): void
    {
        Page::query()->truncate();
    }

    protected function generateShortcodeContent(array $shortcodes): string
    {
        return htmlentities(implode(PHP_EOL, array_map(
            fn ($shortcode): string => Shortcode::generateShortcode(
                $shortcode['name'],
                Arr::get($shortcode, 'attributes', []),
                Arr::get($shortcode, 'content')
            ),
            $shortcodes
        )));
    }
}
