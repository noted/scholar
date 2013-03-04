module Scholar
  module Sources
    class Book < Source
      sequence [
        :author,
        :title,
        :editor,
        :compiler,
        :translator,
        :edition,
        :volume,
        :city,
        :publisher,
        :year,
        :media,
        :series
      ]
    end

    rules do
      rule(:title, italicize)
    end
  end
end
