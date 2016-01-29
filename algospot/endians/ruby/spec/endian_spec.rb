require 'spec_helper'
require 'endian'

RSpec.describe 'ENDIANS' do
  input = [2018915346, 1, 100000, 4294967295]
  output = [305419896, 16777216, 2693136640, 4294967295]

  it 'prints number as little endians' do
    input.each_with_index do |value, index|
      expect(Endian.convert(value)).to eq(output[index])
    end
  end
end
