# Scholar [![Build Status](https://secure.travis-ci.org/noted/scholar.png)](https://travis-ci.org/noted/scholar)

Scholar is a Ruby library for building [MLA citations](http://www.mla.org/) for scholarly works. Just pass Scholar your data and it'll do the rest.

## Installation

Add this line to your `Gemfile`:

```ruby
gem 'scholar'
```

And then run:

```
$ bundle install
```

Or install system-wide with:

```
$ gem install scholar
```

## Usage

To create a citation, create a new `Citation` object.

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

`Scholar::Citation.new` only takes a `Hash` with the attributes associated with the source.

### Required Keys

All source types can (and must) take these fields.

Key             | Description
----------------|-----------------------------------------
`:type`         | The type of publication you're citing ([see the wiki for a list of supported types](types)). Must be a `Symbol` object.
`:contributors` | An array of contributors (see below for details). If there are no contributors, pass an empty `Array`.

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

Each hash can take the following key-values:

Key       | Description
----------|---------------------------------------
`:role`   | Must be `:author`, `:editor`, `:translator`, `:compiler`.
`:first`  | The contributor's first name (name).
`:middle` | The contributor's middle name (will be shortened to a middle initial).
`:last`   | The contributor's last name (surname).
`:suffix` | Any suffixes or titles the contributor has ("PhD", "Esq", "Jr", "KBD", et cetera). Omit any periods.

## Supported Ruby Versions

Scholar is tested on MRI version 1.9.2, 1.9.3, and 2.0.0.

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

[types]: https://github.com/noted/scholar/wiki/Supported-Types
[fork]: http://help.github.com/fork-a-repo/
[branch]: http://learn.github.com/p/branching.html
[pr]: http://help.github.com/send-pull-requests/
