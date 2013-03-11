# Scholar [![Build Status](https://secure.travis-ci.org/noted/scholar.png)](https://travis-ci.org/noted/scholar)

Scholar is a Ruby library for building [MLA citations](http://www.mla.org/) for scholarly works. Just pass Scholar your data and it'll do the rest.

## Installation

```
(sudo) gem install scholar
```

```
gem 'scholar'
```

## Usage

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


To create a citation, you pass `Scholar::Citation` a hash with the attributes associated with the source. See the specific type on [the wiki](https://github.com/noted/scholar/wiki/Supported-Types) for the attributes available.

### Global Attributes

All source types can take these fields.

* `:type` &mdash; The type of publication you're citing ([see the wiki for a list of supported types](https://github.com/noted/scholar/wiki/Supported-Types)).
* `:contributors` &mdash; An array of contributors (see below for details).

#### Contributors

The `:contributors` key is an array of hashes that define contributors. Here's an example.

```ruby
:contributors => [
  {
    :role => :author,
    :first => "Douglas",
    :middle => "Noel",
    :last => "Adams"
  },
  {
    :role => :author,
    :first => "Eion",
    :last => "Colfer"
  },
  {
    :role => :editor,
    :first => "John",
    :last => "Sample",
    :suffix => "PhD"
  }
  {
    :role => :compiler,
    :first => "Steve",
    :last => "Jobs"
  },
  {
    :role => :translator,
    :first => "Bill",
    :last => "Gates"
  }
]
```

Each hash can take the following fields:

* `:role` &mdash; Can be `:author`, `:editor`, `:translator`, `:compiler`.
* `:first` &mdash; The person's name.
* `:middle` &mdash; The person's middle name (will convert to middle initial).
* `:last` &mdash; The person's surname.
* `:suffix` &mdash; Any suffixes the person has ("PhD", "Esq", "Jr", etc). Omit periods.

## Contributing

1. [Fork the repository.][fork]
2. [Create a topic branch.][branch]
3. Add tests for your unimplemented feature or bug fix.
4. Run `bundle exec rspec`. If your tests pass, return to step 3.
5. Implement your feature or bug fix.
6. Run `bundle exec rspec`. If your tests fail, return to step 5.
7. Add documentation for your feature or bug fix.
8. Add, commit, and push your changes.
9. [Submit a pull request.][pr]

[fork]: http://help.github.com/fork-a-repo/
[branch]: http://learn.github.com/p/branching.html
[pr]: http://help.github.com/send-pull-requests/
