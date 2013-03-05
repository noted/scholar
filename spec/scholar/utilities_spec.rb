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

  describe ".contributors" do
    let(:before) {[
      {
        :type => :author,
        :name => "Douglas Adams"
      },
      {
        :type => :author,
        :name => "J.R.R. Tolkein"
      },
      {
        :type => :editor,
        :name => "Les Grossman"
      }
    ]}

    let(:after) {{
      :authors => [
        { :name => "Douglas Adams" },
        { :name => "J.R.R. Tolkein" }
      ],
      :editors => [
        { :name => "Les Grossman" }
      ]
    }}

    let(:contributors) { Scholar::Utilities.contributors(before) }

    it { contributors.should eql(after) }
  end

  describe ".name" do
    it "properly formats names"
  end

  describe ".names" do
    it "puts names in the proper order with punctuation"
  end

  describe ".publication" do
    it "puts publication details in the right order"
  end

  describe ".order!" do
    context "all elements present" do
      let(:hash) { Scholar::Utilities.order!([:foo, :bar], { :bar => "barfoo", :foo => "foobar" }) }

      it { hash.should eql({ :foo => "foobar", :bar => "barfoo" }) }
    end

    context "missing element" do
      let(:hash) { Scholar::Utilities.order!([:foo, :bar], { :bar => "barfoo"}) }

      it { hash.should eql({ :bar => "barfoo" }) }
    end
  end

  describe ".format!" do
    it "formats elements in Hash based on rule definitions"
  end
end
