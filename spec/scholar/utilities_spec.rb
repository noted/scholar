require 'spec_helper'

describe Scholar::Utilities do
  describe ".italicize" do
    let(:str) { Scholar::Utilities.italicize("foobar") }

    it { str.should eql("<em>foobar</em>") }
  end

  describe ".underline" do
    let(:str) { Scholar::Utilities.underline("foobar") }

    it { str.should eql("<u>foobar</u>") }
  end

  describe ".author" do
    context "first name" do
      let(:author) { Scholar::Utilities.author(:first => "John") }

      it { author.should eql("John") }
    end

    context "first name and middle name" do
      let(:author) { Scholar::Utilities.author(:first => "John", :middle => "Quincy") }

      it { author.should eql("John Q.") }
    end

    context "first, middle, and last name" do
      let(:author) { Scholar::Utilities.author(:first => "John", :middle => "Quincy", :last => "Sample") }

      it { author.should eql("Sample, John Q.") }
    end

    context "first, middle, last name, and suffix" do
      let(:author) { Scholar::Utilities.author(:first => "John", :middle => "Quincy", :last => "Sample", :suffix => "Ph.D") }

      it { author.should eql("Sample, John Q., Ph.D")}
    end
  end
end