<aside class="widget widget--blog widget--categories">
    <h3 class="widget__title">{{ $config['name'] }}</h3>
    <div class="widget__content">
        <ul>
            @foreach(app(\App\Plugins\Blog\Repositories\Interfaces\CategoryInterface::class)->advancedGet(['condition' => ['status' => \App\Core\Base\Enums\BaseStatusEnum::PUBLISHED], 'take' => $config['number_display'], 'with' => ['slugable'], 'withCount' => ['posts']]) as $category)
                <li><a href="{{ $category->url }}">{{ $category->name }} ({{ $category->posts_count }})</a></li>
            @endforeach
        </ul>
    </div>
</aside>
