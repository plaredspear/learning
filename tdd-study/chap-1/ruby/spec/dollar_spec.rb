require 'spec_helper'
require 'dollar'

RSpec.describe Dollar do
  describe 'multiply' do
    it 'multiplies' do
      five = Dollar.new(5)
      five.times(2)
      expect(five.amount).to eq(10)
    end
  end
end
