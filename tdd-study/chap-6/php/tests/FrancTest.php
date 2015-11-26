<?php
require 'src/franc.php';

class FrancTest extends PHPUnit_Framework_TestCase {
  public function testMultiplication() {
    $five = new Franc(5);
    $this->assertEquals(new Franc(10), $five->times(2));
    $this->assertEquals(new Franc(15), $five->times(3));
  }

  public function testEquality() {
    $this->assertTrue((new Franc(5))->equals(new Franc(5)));
    $this->assertFalse((new Franc(5))->equals(new Franc(6)));
  }
}
?>
