require 'spec_helper'
require 'franc'

RSpec.describe Franc do
  describe 'multiply' do
    it 'can multiplies' do
      five = Franc.new(5)
      expect(Franc.new(10)).to eql(five.times(2))
      expect(Franc.new(15)).to eql(five.times(3))
    end
  end

  describe 'equality' do
    it 'can be equal' do
      expect(Franc.new(5).eql?(Franc.new(5))).to be true
      expect(Franc.new(5).eql?(Franc.new(6))).to be false
    end
  end
end
