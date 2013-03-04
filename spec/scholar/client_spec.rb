require 'spec_helper'

describe Scholar::Client do
  describe ".initialize" do
    context "without arguments" do
      let(:c) { Scholar::Client.new }

      it { c.output.should eql([:html, :markdown]) }
    end

    context "with arguments" do
      let(:c) do
        Scholar::Client.new do |c|
          c.output [:html, :markdown]
        end
      end

      it { c.output.should eql([:html, :markdown]) }
    end
  end
end
