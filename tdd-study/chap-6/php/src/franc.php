<?php
require_once('money.php');

class Franc extends Money {
  function __construct($amount) {
    $this->amount = $amount;
  }

  public function times($multiplier) {
    return new Franc($this->amount * $multiplier);
  }
}
?>
