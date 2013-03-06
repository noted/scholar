require 'spec_helper'

describe Scholar::Utilities do
  describe ".carets" do
    let(:str) { Scholar::Utilities.carets("foobar") }

    it { str.should eql("&#60;foobar&#62;") }
  end

  describe ".quotes" do
    let(:str) { Scholar::Utilities.quotes("foobar") }

    it { str.should eql("&#8220;foobar&#8221;") }
  end

  describe ".italicize" do
    let(:str) { Scholar::Utilities.italicize("foobar") }

    it { str.should eql("<em>foobar</em>") }
  end

  describe ".underline" do
    let(:str) { Scholar::Utilities.underline("foobar") }

    it { str.should eql("<u>foobar</u>") }
  end

  describe ".order!" do
    context "all elements present" do
      let(:hash) { Scholar::Utilities.order!({ :bar => "barfoo", :foo => "foobar" }, [:foo, :bar]) }

      it { hash.should eql({ :foo => "foobar", :bar => "barfoo" }) }
    end

    context "missing element" do
      let(:hash) { Scholar::Utilities.order!({ :bar => "barfoo"}, [:foo, :bar]) }

      it { hash.should eql({ :bar => "barfoo" }) }
    end
  end

  describe ".format!" do
    it "formats elements in Hash based on rule definitions"
  end
end
