require 'spec_helper'

describe Scholar::Client do
  describe "#initialize" do
    let(:client) do
      Scholar::Client.new do |c|
        c.easybib = 'barfoo'
        c.worldcat = 'foobar'
      end
    end

    it "is an object" do
      client.should be_an_instance_of Scholar::Client
    end

    describe "configuration" do
      it { client.config.easybib.should eql("barfoo") }
      it { client.config.worldcat.should eql("foobar") }
    end
  end
end