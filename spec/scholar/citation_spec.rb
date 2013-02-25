require 'spec_helper'

describe Scholar::Citation do
  describe ".initialize" do
    context "book" do
      let(:book) { Scholar::Citation.new(Book.hash) }

      it { book.hash eql(Book.hash) }
      it { book.html eql(Book.html) }
    end
  end
end
