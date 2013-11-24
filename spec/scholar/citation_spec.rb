require 'spec_helper'

describe Scholar::Citation do
  let(:data) do
    {
      title: 'Harry Potter and the Philosopher\'s Stone',
      authors: [
        {
          name: 'J',
          middle: 'K',
          surname: 'Rowling'
        }
      ],
      editors: [
        {
          name: 'J',
          middle: 'K',
          surname: 'Rowling'
        }
      ],
      edition: 1,
      volume: 1,
      publisher: 'Bloomsbury',
      city: 'London',
      year: '1997',
      series: 'Harry Potter',
      media: 'print'
    }
  end

  let(:citation) do
    Scholar::Citation.new(:book, data)
  end

  describe '.initialize' do
    it 'creates the correct citation' do
      citation.should eql 'Rowling, J. K. <em>Harry Potter and the Philosopher\'s Stone</em>. Ed. J. K. Rowling. 1st ed. Vol. 1. London: Bloomsbury, 1997. Print. Harry Potter.'
    end
  end
end
