# Scholar [![Build Status](https://secure.travis-ci.org/noted/scholar.png)](https://travis-ci.org/noted/scholar)

Scholar is meant to aid in creating MLA citations by providing a wrapper for the [EasyBib](http://easybib.com) API.

```ruby
scholar = Scholar::Client.new do |s|
  s.easybib_key 'EASYBIB-API-KEY'
  s.loc_key 'LIBRARY_OF_CONGRESS_KEY'
  s.worldcat_key 'WORLDCAT_KEY'

  s.output :html, :markdown, :bibtex
end

# Books
salinger = scholar.cite({
  :type => :book,
  :media => :print,
  :title => "The Catcher in the Rye",
  :contributors => [
    {
      :type => :author,
      :first => "J",
      :middle => "D",
      :last => "Salinger"
    }
  ]
  :publication => {
    :name => "Little, Brown",
    :city => "Boston",
    :year => "1995"
  }
})
salinger.html # => Salinger, J. D. <u>Catcher in the Rye<\/u>. Boston: Little, Brown, 1995.

# Magazines
wired = scholar.cite({
  :type => :magazine,
  :media => :print,
  :title => "The Web Is Dead. Long Live the Internet",
  :contributors => [
    {
      :type => :author,
      :first => "Chris",
      :last => "Anderson"
    },
    {
      :type => :author,
      :first => "Michael",
      :last => "Wolff"
    }
  ],
  :publication => {
    :name => "WIRED Magazine",
    :month => "September",
    :year => "2010",
  },
  :pages => [97..104]
})
wired.html # => Anderson, Chris, and Michael Wolff. "The Web Is Dead. Long Live the Internet." WIRED Magazine Sept. 2010: 97-104. Print.

# Websites
stuff = scholar.cite({
  :type => :website,
  :media => :online,
  :title => "Stuff",
  :contributors => [
    {
      :type => :author,
      :first => "Paul",
      :last => "Graham"
    }
  ],
  :publication => {
    :name => "Paul Graham",
    :month => "July",
    :year => "2007",
    :url => "http://www.paulgraham.com/stuff.html"
  }
})
stuff.html # => Graham, Paul. "Stuff." Stuff. Paul Graham, July 2007. Web. 15 Jan. 2013.
```