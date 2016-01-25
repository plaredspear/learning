require 'spec_helper'

class Foo
  attr_accessor :bar
end

class Bar
  def name
    'spiderman'
  end
end

RSpec.describe 'safe navigation operator' do
  context 'with safe navigation operator' do
    it "isn't raise error" do
      foo = Foo.new
      result = foo&.bar&.name

      expect(result).to eq(nil)

      foo.bar = Bar.new
      result = foo&.bar&.name

      expect(result).to eq('spiderman')
    end
  end

  context 'without safe navigation operator' do
    it "isn't raise error" do
      foo = Foo.new
      result = foo && foo.bar && foo.bar.name

      expect(result).to eq(nil)

      foo.bar = Bar.new
      result = foo && foo.bar && foo.bar.name

      expect(result).to eq('spiderman')
    end
  end
end
