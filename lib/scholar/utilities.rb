module Scholar
  module Utilities
    class << self
      def italicize(str)
        "<em>#{str}</em>"
      end

      def underline(str)
        "<u>#{str}</u>"
      end

      def author(attr = {}) # Clean up. Handle blank attributes.
        last = attr[:last] ? "#{attr[:last]}, " : nil
        first = attr[:first] ? "#{attr[:first]}" : nil
        middle = attr[:middle] ? " #{attr[:middle][0,1]}." : nil
        suffix = attr[:suffix] ? ", #{attr[:suffix]}" : nil

        "#{last}#{first}#{middle}#{suffix}"
      end
    end
  end
end