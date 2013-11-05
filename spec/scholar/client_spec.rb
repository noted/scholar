require 'spec_helper'

describe Scholar::Client do
  describe '.initialize' do
    let(:client) do
      Scholar::Client.new({
        output: [:html, :markdown, :word]
      })
    end

    it { client.should be_an_instance_of Scholar::Client }
    it { client.output.should eql [:html, :markdown, :word] }
  end

  describe '.configure' do
    let(:client) do
      scholar = Scholar::Client.new
      scholar.configure do |c|
        c.output = [:html, :markdown, :word]
      end

      scholar
    end

    it { client.output.should eql [:html, :markdown, :word] }
  end
end
