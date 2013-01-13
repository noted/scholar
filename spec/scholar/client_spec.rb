require 'spec_helper'

describe Scholar::Client do
  describe "#initialize" do
    let(:client) do
      Scholar::Client.new do |c|
        c.easybib_key 'foobar'
      end
    end

    it "is an object" do
      client.should be_valid
      client.should be_an_instance_of Scholar::Client
    end
    
    it "sets EasyBib API key" do
      client.easybib_key.should eql('foobar')
    end
  end
end