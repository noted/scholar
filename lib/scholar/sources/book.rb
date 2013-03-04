module Scholar
  module Sources
    class Book < Source
      sequence [
        :foo,
        :bar
      ]
    end
  end
end
