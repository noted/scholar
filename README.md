# Scholar

At its core, Scholar is really just synactic sugar on top of the excellent [CiteProc](https://github.com/inukshuk/citeproc) library. Simply pass source information, and it will format it in one of [over 900 citation styles](https://github.com/citation-style-language/styles/tree/master/dependent) available using the [Citation Style Language](http://citationstyles.org). Scholar also has the ability to search through an assortment of different databases for sources to cite.

## Installation

Add this line to your application's Gemfile:

    gem 'scholar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scholar

## Usage

### Client

```ruby
s = Scholar::Client.new
```

### Styles

There are over 900 styles available. You can grab all of them:

```ruby
s.styles.all # => [ Scholar::Style, Scholar::Style ]
```

Or a specific one by its shortname or title:

```ruby
s.styles.find(title: 'Modern Language Association') # => Scholar::Style
s.styles.find(shortname: 'apa') # => Scholar::Style
```

You can also grab information about a style:

```ruby
mla = styles.find(title: 'Modern Language Association')
mla.shortname # => 'modern-language-association'
mla.csl # => CSL::Style
mla.fields # => { author: { given: :string, family: :string }, title: :string, issued: { 'date-parts': :integer } }
mla.fields(html: 'source') # => [ '<input type="text" name="source[author][given]">', ...]
```

### Citations

```ruby
mla = s.styles.find(title: 'Modern Language Association')

information = {
  'author' => [
    {
      'given' => 'Edgar Allen',
      'family' => 'Poe'
    }
  ],
  'title' => 'Poetry, Tales, and Selected Essays',
  'type' => 'book',
  'issued' => {
    'date-parts' => [ [ 1996 ] ]
  },
  'editor' => [
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
}

s.citations.verify_reference?(information) # => true

citation = s.citations.new(information, mla, format: :html) # => Scholar::Citation

citation.render(:html) # => 'Poe, Edgar Allen. <i>Poetry, Tales, and Selected Essays</i>. Ed. Patrick F. Quinn and G.R. Thompson. New York: Library of America, 1996. Print.'
```

## Contributing

1. Fork it ( http://github.com/noted/scholar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
