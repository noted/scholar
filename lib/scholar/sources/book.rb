module Scholar
  class Book < Source
    name "Book"

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

    rules do
      underline :title
    end
  end
end
