module Scholar
  module Sources
    class Book < Source
      sequence [
        :foo,
        :bar
      ]

      rules do |r|
        r.italicize("foo")
      end
    end
  end
end
