# Scholar [![Build Status](https://secure.travis-ci.org/noted/scholar.png)](https://travis-ci.org/noted/scholar)

Scholar is a Ruby library for building [MLA citations](http://www.mla.org/).

```ruby
salinger = Scholar::Citation.new({
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
  ],
  :publication => {
    :name => "Little, Brown",
    :city => "Boston",
    :year => "1995"
  }
})
salinger.html # => Salinger, J. D. <u>Catcher in the Rye<\/u>. Boston: Little, Brown, 1995.
```
