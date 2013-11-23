require 'spec_helper'

describe Scholar::Type do
  let(:type) do
    Scholar::Type.new(File.open('fixtures/test.yml'))
  end

  describe '.initialize' do
    it { type.should be_an_instance_of Scholar::Type }
  end

  describe '#type' do
    let(:type) { type.type }

    it { type.should eql 'test' }
  end

  describe '#order' do
    let(:order) { type.order }

    it { order.should be_an_instance_of Array }
    it { order.should eql [:foo, :bar, :biz, :baz] }
  end

  describe '#formatting' do
    let(:formatting) { type.formatting }

    it { formatting.should be_an_instance_of Array }
    it { formatting[0][0].should eql :foo }
    it { formatting[0][1].should be_an_instance_of Scholar::Formatter }
  end
end
