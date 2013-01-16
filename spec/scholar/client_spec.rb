require 'spec_helper'

describe Scholar::Client do
  describe "#initialize" do
    let(:client) do
      Scholar::Client.new {|c|  }
    end

    it "creates a Scholar::Client object" do
      client.should be_an_instance_of Scholar::Client
    end
  end
end