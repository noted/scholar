require 'spec_helper'

describe Scholar::Client do
  describe ".initialize" do
    context "without arguments" do
      let(:c) { Scholar::Client.new }

      it { c.output.should eql([:html, :markdown]) }
    end

    context "with arguments" do
      let(:c) { Scholar::Client.new({ :output => [:html, :bibtex] }) }

      it { c.output.should eql([:html, :bibtex]) }
    end
  end
end
