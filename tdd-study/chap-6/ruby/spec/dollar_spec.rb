require 'spec_helper'
require 'dollar'

RSpec.describe Dollar do
  describe 'multiply' do
    it 'can multiplies' do
      five = Dollar.new(5)
      expect(Dollar.new(10)).to eql(five.times(2))
      expect(Dollar.new(15)).to eql(five.times(3))
    end
  end

  describe 'equality' do
    it 'can be equal' do
      expect(Dollar.new(5).eql?(Dollar.new(5))).to be true
      expect(Dollar.new(5).eql?(Dollar.new(6))).to be false
    end
  end
end
