<?php
class Franc {
  private $amount;

  function __construct($amount) {
    $this->amount = $amount;
  }

  public function times($multiplier) {
    return new Franc($this->amount * $multiplier);
  }

  public function equals($franc) {
    return $this->amount == $franc->amount;
  }
}
?>
