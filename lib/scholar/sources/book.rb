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
        rule(:title, italicize) # Calls #italicize with :title as argument
      end
    end
  end
end
