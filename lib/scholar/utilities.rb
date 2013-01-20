module Scholar
  module Utilities
    class << self
      def italicize(str)
        "<em>#{str}</em>"
      end

      def underline(str)
        "<u>#{str}</u>"
      end

      def author(attr = {}) # Clean up. Handle black attributes.
        last = "#{attr[:last]}, "
        first = "#{attr[:first]} "
        middle = "#{attr[:middle][0,1]}."
        suffix = ", #{attr[:suffix]}"

        last + first + middle + suffix
      end
    end
  end
end