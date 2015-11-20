<?php
require 'src/dollar.php';

class DollarTest extends PHPUnit_Framework_TestCase {
  public function testMultiplication() {
    $five = new Dollar(5);
    $product = $five->times(2);
    $this->assertEquals($product->amount, 10);

    $product = $five->times(3);
    $this->assertEquals($product->amount, 15);
  }

  public function testEquality() {
    $this->assertTrue((new Dollar(5))->equals(new Dollar(5)));
  }
}
?>
