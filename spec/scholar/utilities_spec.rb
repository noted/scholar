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

  describe ".format" do
    it "formats elements of an hash with a given sequence"
  end

  describe ".flatten" do
    it "splits Arrays of Hashes within a Hash into different arrays based on the `:type` element"
  end

  describe ".name" do
    context "first name" do
      let(:author) { Scholar::Utilities.name(:first => "John") }

      it { author.should eql("John") }
    end

    context "first name and middle name" do
      let(:author) { Scholar::Utilities.name(:first => "John", :middle => "Quincy") }

      it { author.should eql("John Q.") }
    end

    context "first, middle, and last name" do
      let(:author) { Scholar::Utilities.name(:first => "John", :middle => "Quincy", :last => "Sample") }

      it { author.should eql("Sample, John Q.") }
    end

    context "first, middle, last name, and suffix" do
      let(:author) { Scholar::Utilities.name(:first => "John", :middle => "Quincy", :last => "Sample", :suffix => "Ph.D") }

      it { author.should eql("Sample, John Q., Ph.D")}
    end
  end

  describe ".order" do
    context "all elements present" do
      let(:hash) { Scholar::Utilities.order([:foo, :bar], { :bar => "barfoo", :foo => "foobar" }) }

      it { hash.should eql({ :foo => "foobar", :bar => "barfoo" }) }
    end

    context "missing element" do
      let(:hash) { Scholar::Utilities.order([:foo, :bar], { :bar => "barfoo"}) }

      it { hash.should eql({ :bar => "barfoo" }) }
    end
  end
end
