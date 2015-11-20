require 'spec_helper'
require 'dollar'

RSpec.describe Dollar do
  describe 'multiply' do
    it 'multiplies' do
      five = Dollar.new(5)
      product = five.times(2)
      expect(product.amount).to eq(10)

      product = five.times(3)
      expect(product.amount).to eq(15)
    end
  end
end
