<?php
require_once('money.php');

class Dollar extends money {
  function __construct($amount) {
    $this->amount = $amount;
  }

  public function times($multiplier) {
    return new Dollar($this->amount * $multiplier);
  }
}
?>
