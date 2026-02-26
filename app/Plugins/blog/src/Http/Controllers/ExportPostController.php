<?php

namespace App\Plugins\Blog\Http\Controllers;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Plugins\Blog\Exporters\PostExporter;
use App\Packages\DataSynchronize\Exporter\Exporter;
use App\Packages\DataSynchronize\Http\Controllers\ExportController;
use App\Packages\DataSynchronize\Http\Requests\ExportRequest;

class ExportPostController extends ExportController
{
    protected function getExporter(): Exporter
    {
        $exporter = PostExporter::make();

        if (request()->has('limit')) {
            $exporter->setLimit((int) request()->input('limit'));
        }

        if (request()->has('status') && request()->input('status') !== '') {
            $exporter->setStatus(request()->input('status'));
        }

        if (request()->has('is_featured') && request()->input('is_featured') !== '') {
            $exporter->setIsFeatured((bool) request()->input('is_featured'));
        }

        if (request()->has('category_id') && request()->input('category_id') !== '') {
            $exporter->setCategoryId((int) request()->input('category_id'));
        }

        if (request()->has(['start_date', 'end_date'])) {
            $exporter->setDateRange(
                request()->input('start_date'),
                request()->input('end_date')
            );
        }

        return $exporter;
    }

    public function store(ExportRequest $request)
    {
        $request->validate([
            'limit' => ['nullable', 'integer', 'min:1'],
            'status' => ['nullable', 'string', 'in:' . implode(',', BaseStatusEnum::values())],
            'is_featured' => ['nullable', 'boolean'],
            'category_id' => ['nullable', 'integer', 'exists:categories,id'],
            'start_date' => ['nullable', 'date'],
            'end_date' => ['nullable', 'date', 'after_or_equal:start_date'],
        ]);

        return parent::store($request);
    }
}
