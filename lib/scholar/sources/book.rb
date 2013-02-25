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
          Scholar::Utilities.italicize(:title)
        ]
      end
    end
  end
end
