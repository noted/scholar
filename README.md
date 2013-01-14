# Scholar [![Build Status](https://secure.travis-ci.org/noted/scholar.png)](https://travis-ci.org/noted/scholar)

Scholar is meant to aid in creating MLA citations by providing a wrapper for the [EasyBib](http://easybib.com) API.

```ruby
scholar = Scholar::Client.new do |s|
  s.easybib_key 'EASYBIB-API-KEY'
  s.loc_key 'LIBRARY_OF_CONGRESS_KEY'
  s.worldcat_key 'WORLDCAT_KEY'

  s.output :html, :markdown, :bibtex
end

salinger = scholar.book.cite({
  :title => "Catcher in the Rye",
  :contributors => [
    {
      :function => "author",
      :first => "J",
      :middle => "D",
      :last => "Salinger"
    }
  ],
  :publisher => "Little, Brown",
  :city => "Boston",
  :year => "1995"
})

salinger.html # => Salinger, J. D. <u>Catcher in the Rye<\/u>. Boston: Little, Brown, 1995.
```