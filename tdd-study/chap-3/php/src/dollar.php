<?php
class Dollar {
  var $amount;

  function __construct($amount) {
    $this->amount = $amount;
  }

  public function times($multiplier) {
    return new Dollar($this->amount * $multiplier);
  }

  public function equals($dollar) {
    return $this->amount == $dollar->amount;
  }
}
?>
