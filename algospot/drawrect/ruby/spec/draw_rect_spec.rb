require 'spec_helper'

RSpec.describe 'Draw Rectangular' do
  input1 = [
    [5, 5],
    [5, 7],
    [7, 5]
  ]

  input2 = [
    [30, 20],
    [10, 10],
    [10, 20]
  ]

  output1 = [7, 7]
  output2 = [30, 10]

  def last_coordinates(input)
    count_x = {}
    count_y = {}

    input.map do |coordinates|
      x = coordinates[0]
      y = coordinates[1]

      if count_x[x]
        count_x[x] += 1
      else
        count_x[x] = 1
      end

      if count_y[y]
        count_y[y] += 1
      else
        count_y[y] = 1
      end
    end

    count_x.map { |k, v| k if v == 1 }.compact +
      count_y.map { |k, v| k if v == 1 }.compact
  end

  it 'returns last coordinates' do
    expect(last_coordinates(input1)).to eq(output1)
    expect(last_coordinates(input2)).to eq(output2)
  end
end
