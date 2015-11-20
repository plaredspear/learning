require 'spec_helper'
require 'dollar'

RSpec.describe Dollar do
  describe 'multiply' do
    it 'can multiplies' do
      five = Dollar.new(5)
      product = five.times(2)
      expect(product.amount).to eq(10)

      product = five.times(3)
      expect(product.amount).to eq(15)
    end
  end

  describe 'equality' do
    it 'can be equal' do
      expect(Dollar.new(5).equals(Dollar.new(5))).to be true
      expect(Dollar.new(5).equals(Dollar.new(6))).to be false
    end
  end
end
