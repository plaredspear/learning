<?php
require 'src/dollar.php';

class DollarTest extends PHPUnit_Framework_TestCase {
  public function testMultiplication() {
    $five = new Dollar(5);
    $five->times(2);
    $this->assertEquals($five->amount, 10);
  }
}
?>
