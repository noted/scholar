require 'spec_helper'

describe Scholar::Configuration do
  context "default values" do
    let(:client) { Scholar::Client.new {|c|  } }

    it "EasyBib key is nil" do
      client.conf.easybib.should be_nil
    end

    it "WorldCat key is nil" do
      client.conf.worldcat.should be_nil
    end

    it "formats are nil" do
      client.conf.format.should be_nil
    end
  end

  context "when set" do
    let(:client) do
      Scholar::Client.new do |c|
        c.easybib  = 'foobar'
        c.worldcat = 'barfoo'
        c.format = [:markdown, :html, :bibtex]
      end
    end

    it "EasyBib key is not nil" do
      client.conf.easybib.should eql('foobar')
    end

    it "WorldCat key is not nil" do
      client.conf.worldcat.should eql('barfoo')
    end

    it "format not nil" do
      client.conf.format.should eql([:markdown, :html, :bibtex])
    end
  end
end