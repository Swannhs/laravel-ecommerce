<?php

namespace App\Packages\SeoHelper\Entities;

use App\Packages\SeoHelper\Bases\MetaCollection as BaseMetaCollection;
use App\Packages\SeoHelper\Exceptions\InvalidArgumentException;
use App\Packages\SeoHelper\Helpers\Meta;

class MetaCollection extends BaseMetaCollection
{
    /**
     * Ignored tags, they have dedicated class.
     *
     * @var array
     */
    protected $ignored = [
        'description',
    ];

    /**
     * Add a meta to collection.
     *
     * @param $item
     * @return MetaCollection
     * @throws InvalidArgumentException
     */
    public function add($item)
    {
        $meta = Meta::make($item['name'], $item['content']);

        if ($meta->isValid() && ! $this->isIgnored($item['name'])) {
            $this->put($meta->key(), $meta);
        }

        return $this;
    }
}
