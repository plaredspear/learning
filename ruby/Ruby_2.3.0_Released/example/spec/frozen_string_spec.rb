require 'spec_helper'

RSpec.describe 'Frozen String Literals' do
  context 'with freezing' do
    it "can't modify" do
      foo = "foo".freeze

      expect { foo << "ing" }.to raise_error(RuntimeError)
    end
  end

  context 'without freezing' do
    it "can change" do
      foo = "foo"
      foo << "ing"

      expect(foo).to eq("fooing")
    end
  end
end
