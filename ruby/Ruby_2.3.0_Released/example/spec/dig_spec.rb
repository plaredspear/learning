require 'spec_helper'

RSpec.describe 'Array#dig, Hash#dig' do
  describe 'Array#dig' do
    it 'returns value' do
      a = [[1, [2, 3]]]

      expect(a.dig(0, 1, 1)).to eq(3)
      expect(a.dig(0, 3)).to eq(nil)
      expect(a.dig(0, 3, 0)).to eq(nil)

      # !!!: Fixnum does not have #dig method
      #expect(a.dig(0, 0, 0)).to eq(nil)
    end
  end

  describe 'Hash#dig' do
    it 'returns value' do
      h = {
        a: {
          b: {
            c: 1
          }
        }
      }

      expect(h.dig(:a, :b, :c)).to eq(1)
      expect(h.dig(:a, :c)).to eq(nil)
      expect(h.dig(:a, :c, :d)).to eq(nil)

      # !!!: Fixnum does not have #dig method
      #expect(h.dig(:a, :b, :c, :d)).to eq(nil)
    end
  end
end
