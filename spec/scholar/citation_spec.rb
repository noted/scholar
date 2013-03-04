require 'spec_helper'

describe Scholar::Citation do
  describe ".initialize" do
    context "book" do
      let(:book) { Scholar::Citation.new(Book.hash) }
      
      # TODO: Update these for formatting and such
      # it { book.hash.should eql(Book.hash) }
      # it { book.html.should eql(Book.html) }
    end
  end
end
