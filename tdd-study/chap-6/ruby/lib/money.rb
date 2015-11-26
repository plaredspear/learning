class Money
  def eql?(object)
    @amount == object.amount
  end

  protected

  attr :amount
end
