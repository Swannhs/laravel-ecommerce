<?php

namespace App\Plugins\Faq\Contracts;

use App\Plugins\Faq\FaqCollection;

interface Faq
{
    public function registerSchema(FaqCollection $faqs): void;
}
