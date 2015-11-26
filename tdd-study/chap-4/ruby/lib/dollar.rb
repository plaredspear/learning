class Dollar
  attr :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(amount * multiplier)
  end

  def eql?(dollar)
    @amount == dollar.amount
  end
end
