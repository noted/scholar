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

      rules do
        italicize(:title) # Calls #italicize with :title as argument
      end
    end
  end
end
