<?php
class Dollar {
  var $amount;

  function __construct($amount) {
    $this->amount = $amount;
  }

  public function times($multiplier) {
    $this->amount *= $multiplier;
  }
}
?>
