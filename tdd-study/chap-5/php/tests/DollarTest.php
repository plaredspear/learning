<?php
require 'src/dollar.php';

class DollarTest extends PHPUnit_Framework_TestCase {
  public function testMultiplication() {
    $five = new Dollar(5);
    $this->assertEquals(new Dollar(10), $five->times(2));
    $this->assertEquals(new Dollar(15), $five->times(3));
  }

  public function testEquality() {
    $this->assertTrue((new Dollar(5))->equals(new Dollar(5)));
    $this->assertFalse((new Dollar(5))->equals(new Dollar(6)));
  }
}
?>
