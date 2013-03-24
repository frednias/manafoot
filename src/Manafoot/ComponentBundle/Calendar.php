<?php

namespace Manafoot\ComponentBundle;

class Calendar {

	public $startDate;
	public $currentDate;

	public function __construct () {
		$this->startDate = new \DateTime('2013-07-15');
		// TODO : compute ELO ranking for first date
	}
}

