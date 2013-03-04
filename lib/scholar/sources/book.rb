module Scholar
  module Sources
    class Book
      extend Source

      sequence [
        :foo,
        :bar
      ]
    end
  end
end
