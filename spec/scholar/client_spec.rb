require 'spec_helper'

describe Scholar::Client do
  describe '.initialize' do
    let(:client) do
      Scholar::Client.new({
        output: [:html, :markdown, :word]
      })
    end

    it 'initialized properly' do
      client.should be_an_instance_of Scholar::Client
    end

    it 'sets configuration correctly' do
      client.output.should eql [:html, :markdown, :word]
    end
  end

  describe '.configure' do
    let(:client) do
      scholar = Scholar::Client.new
      scholar.configure do |c|
        c.output = [:html, :markdown, :word]
      end

      scholar
    end

    it 'sets configuration properly' do
      client.output.should eql [:html, :markdown, :word]
    end
  end
end
