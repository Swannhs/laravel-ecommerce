<?php

namespace App\Plugins\Analytics\Facades;

use App\Plugins\Analytics\Abstracts\AnalyticsAbstract;
use Illuminate\Support\Facades\Facade;

/**
 * @method static string getCredentials()
 * @method static \Google\Analytics\Data\V1beta\Client\BetaAnalyticsDataClient getClient()
 * @method static \App\Plugins\Analytics\AnalyticsResponse get()
 * @method static \Illuminate\Support\Collection fetchMostVisitedPages(\App\Plugins\Analytics\Period $period, int $maxResults = 20)
 * @method static \Illuminate\Support\Collection fetchTopReferrers(\App\Plugins\Analytics\Period $period, int $maxResults = 20)
 * @method static \Illuminate\Support\Collection fetchTopBrowsers(\App\Plugins\Analytics\Period $period, int $maxResults = 10)
 * @method static \Illuminate\Support\Collection performQuery(\App\Plugins\Analytics\Period $period, array|string $metrics, array|string $dimensions = [])
 * @method static string getPropertyId()
 * @method static void macro(string $name, object|callable $macro)
 * @method static void mixin(object $mixin, bool $replace = true)
 * @method static bool hasMacro(string $name)
 * @method static void flushMacros()
 * @method static \App\Plugins\Analytics\Analytics dateRange(\App\Plugins\Analytics\Period $period)
 * @method static \App\Plugins\Analytics\Analytics dateRanges(\App\Plugins\Analytics\Period ...$items)
 * @method static \App\Plugins\Analytics\Analytics metric(string $name)
 * @method static \App\Plugins\Analytics\Analytics metrics(array|string $items)
 * @method static \App\Plugins\Analytics\Analytics dimension(string $name)
 * @method static \App\Plugins\Analytics\Analytics dimensions(array|string $items)
 * @method static \App\Plugins\Analytics\Analytics orderByMetric(string $name, string $order = 'ASC')
 * @method static \App\Plugins\Analytics\Analytics orderByMetricDesc(string $name)
 * @method static \App\Plugins\Analytics\Analytics orderByDimension(string $name, string $order = 'ASC')
 * @method static \App\Plugins\Analytics\Analytics orderByDimensionDesc(string $name)
 * @method static \App\Plugins\Analytics\Analytics metricAggregation(int $value)
 * @method static \App\Plugins\Analytics\Analytics metricAggregations(int ...$items)
 * @method static \App\Plugins\Analytics\Analytics whereDimension(string $name, int $matchType, $value, bool $caseSensitive = false)
 * @method static \App\Plugins\Analytics\Analytics whereDimensionIn(string $name, array $values, bool $caseSensitive = false)
 * @method static \App\Plugins\Analytics\Analytics whereMetric(string $name, int $operation, $value)
 * @method static \App\Plugins\Analytics\Analytics whereMetricBetween(string $name, $from, $to)
 * @method static \App\Plugins\Analytics\Analytics keepEmptyRows(bool $keepEmptyRows = false)
 * @method static \App\Plugins\Analytics\Analytics limit(int|null $limit = null)
 * @method static \App\Plugins\Analytics\Analytics offset(int|null $offset = null)
 *
 * @see \App\Plugins\Analytics\Analytics
 */
class Analytics extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return AnalyticsAbstract::class;
    }
}
