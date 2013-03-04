require 'spec_helper'

describe Scholar::Client do
  describe ".initialize" do
    let(:client) { Scholar::Client.new }

    it { client.should be_an_instance_of Scholar::Client }
  end
end
