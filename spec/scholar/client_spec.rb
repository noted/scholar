require 'spec_helper'

describe Scholar::Client do
  describe '.new' do
    it 'returns a correct instance' do
      expect(client).to be_an_instance_of Scholar::Client
    end

    it 'has correct configuration' do
      expect(client.csl).to eql 'modern-language-association'
    end
  end
end
