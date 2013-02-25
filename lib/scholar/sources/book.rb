module Scholar
  class Book < Source
    class << self
      def sequence
        [
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

      def format
        [
          replace(:title, italicize(:title))
          replace(:edition, "#{cardinal(:edition)} ed.")
        ]
      end
    end
  end
end
