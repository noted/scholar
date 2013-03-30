require 'spec_helper'

describe Scholar::Search do
  before do
    VCR.insert_cassette 'search', :record => :all
  end

  describe ".new" do
    let(:search) do
      Scholar::Search.new("foobar")
    end

    it { search.query.should eql "foobar" }
    it { search.results.should be_an_instance_of Array }
    it { search.results[0].should be_an_instance_of Scholar::Citation }
  end

  after do
    VCR.eject_cassette
  end
end
