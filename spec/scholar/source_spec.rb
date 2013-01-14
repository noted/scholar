require 'spec_helper'

# An interface for ::Citation
describe Scholar::Source do
  describe Scholar::Source::Book do
    let(:book) do
      scholar.book.cite(Book.hash)
    end

    it { book.should be_An_instance_of Scholar::Citation }
    
    it "fills in the HTML" do
      book.html.should eql("Salinger, J. D. <u>Catcher in the Rye<\/u>. Boston: Little, Brown, 1995.")
    end
  end
end