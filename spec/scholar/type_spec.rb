require 'spec_helper'

describe Scholar::Type do
  let(:type) do
    Scholar::Type.new(File.open(File.join(File.expand_path(File.dirname(__FILE__)), '..', 'fixtures', 'test.yml')))
  end

  let(:data) do
    {
      bar: 'foo',
      foo: 'bar'
    }
  end

  describe '.initialize' do
    it 'returns the correct class' do
      type.should be_an_instance_of Scholar::Type
    end
  end

  describe '#name' do
    let(:name) { type.name }

    it 'parses the name correctly' do
      name.should eql 'test'
    end
  end

  describe '#sequence!' do
    let(:sequence) { type.sequence }

    it 'returns an Array' do
      sequence.should be_an_instance_of Array
    end

    it 'sorts correctly' do
      sequence.should eql [:foo, :bar, :biz, :baz]
    end
  end

  describe '#formatting!' do
    let(:formatting) { type.formatting }

    it 'returns a Hash' do
      formatting.should be_an_instance_of Hash
    end

    it 'sets the keys correctly' do
      formatting.first[0].should eql :foo
    end

    it 'sets an array of Formatters for each key' do
      formatting.first[1].should be_an_instance_of Array
      formatting.first[1][0].should be_an_instance_of Scholar::Formatter
    end
  end

  describe '#order' do
    let(:ordered) { type.order(data) }

    it 'orders the attributes correctly' do
      ordered.keys.should eql [:foo, :bar]
    end
  end

  describe '#format' do
    let(:formatted) { type.format(data) }

    it 'formats correctly' do
      formatted[:foo].should eql 'Ed. bar.'
    end
  end
end
