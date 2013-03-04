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
        italicize(:title)
        replace(:edition, "#{cardinal(:edition)} ed.")
      end
    end
  end
end
