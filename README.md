# Scholar [![Build Status](https://secure.travis-ci.org/noted/scholar.png)](https://travis-ci.org/noted/scholar)

Scholar is a Ruby library for building [MLA citations](http://www.mla.org/) for scholarly works.

```ruby
salinger = Scholar::Citation.new({
  :type => :book,
  :media => :print,
  :title => "The Catcher in the Rye",
  :contributors => [
    {
      :role => :author,
      :first => "J",
      :middle => "D",
      :last => "Salinger"
    }
  ],
  :publisher => "Little, Brown",
  :city => "Boston",
  :year => "1995"
})
salinger.html # => Salinger, J. D. <em>Catcher in the Rye</em>. Boston: Little, Brown, 1995.
```

For documentation on the attributes of each source type, [see the wiki](https://github.com/noted/scholar/wiki/Supported-Types).
