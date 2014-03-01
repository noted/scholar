require 'spec_helper'

describe Scholar::Citation do
  let(:citation) do
    client.cite({
      'author' => [
        {
          'given' => 'Edgar Allen',
          'family'=>'Poe'
        }
      ],
      'title' => 'Poetry, Tales, and Selected Essays',
      'type' => 'book',
      'issued' => {
        'date-parts'=> [ [ 1996 ] ]
      },
      'editor'=> [
        {
          'family' => 'Quinn',
          'given' => 'Patrick F.'
        },
        {
          'family' => 'Thompson',
          'given' => 'G.R.'
        }
      ],
      'publisher' => 'Library of America',
      'publisher-place' => 'New York'
    })
  end

  describe '.new' do
    it 'returns a correct instance' do
      expect(citation).to be_an_instance_of Scholar::Citation
    end

    it 'returns a citation' do
      expect(citation.citation).to_not be_nil
    end
  end
end
