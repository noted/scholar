require "spec_helper"

describe Scholar::Source do
  describe ".sequence" do
    context "passed Array" do
      let(:sequence) { Scholar::Source.sequence([:foo, :bar]) }

      it { Scholar::Source.sequence eql([:foo, :bar]) }
    end

    context "no arguments" do
      let(:sequence) { Scholar::Source.sequence }

      it { sequence.should raise_error }
    end
  end
end
