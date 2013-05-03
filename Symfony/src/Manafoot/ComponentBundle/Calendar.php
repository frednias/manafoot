<?php

namespace Manafoot\ComponentBundle;

class Calendar {

	public $startDate;
	public $currentDate;

	public function __construct () {
		$this->startDate = new \DateTime('2010-07-12');
	}
}

