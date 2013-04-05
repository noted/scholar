require 'spec_helper'

describe Scholar::Sources::Website do
let(:data) do
    {
      :type => :website,
      :title => "The Web is Dead. Long Live the Internet",
      :website => "WIRED",
      :contributors => [
        {
          :role => :author,
          :first => "Chris",
          :last => "Anderson"
        },
        {
          :role => :author,
          :first => "Michael",
          :last => "Wolff"
        },
        {
          :role => :editor,
          :first => "Chuck",
          :last => "Squatriglia"
        },
        {
          :role => :translator,
          :first => "Linda",
          :last => "Zabor"
        }
      ],
      :publisher => "WIRED Magazine",
      :date => Date.new(2010, 8, 17),
      :accessed => Date.new(2013, 4, 5),
      :url => "http://www.wired.com/magazine/2010/08/ff_webrip"
    }
  end

  let(:citation) do
    "Adams, Douglas N. <em>The Hitchhiker's Guide to the Galaxy</em>. Ed. Peter Guzzardi. Comp. Eion Colfer. Trans. Les Grossman. 1st ed. Vol. 1. London: Random House, 1972. Print. The Hitchhiker's Guide to the Galaxy."
  end

  let(:c) { Scholar::Citation.new(data) }

  it { c.html.should eql citation }
end
