module Scholar
  module Sources
    class Book
      include Scholar::Source

      sequence [
        :foo,
        :bar
      ]
    end
  end
end
