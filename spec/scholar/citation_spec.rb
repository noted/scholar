require 'spec_helper'

# Makes the actual request
describe Scholar::Citation do
  let(:citation) { Scholar::Citation.new(:book, Book.raw) }

  describe "#initialize" do
    it { citation.should be_an_instance_of Scholar::Citation }
    it { citation.data.should eql(Book.raw) }
    it { citation.json.should eql(Book.json) }
    it { citation.html.should eql(Book.html) }
  end
end