class Franc
  attr :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Franc.new(amount * multiplier)
  end

  def eql?(franc)
    @amount == franc.amount
  end
end
