require 'spec_helper'

describe Scholar::Citation do
  let(:citation) { scholar.cite(Book.raw) }

  describe "#initialize" do
    it { citation.should be_an_instance_of Scholar::Citation }
  end
end