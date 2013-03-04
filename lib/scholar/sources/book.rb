module Scholar
  module Sources
    class Book < Scholar::Source
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
        rule(:title) {|v| italicize(v) }
      end
    end
  end
end
