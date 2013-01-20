module Scholar
  module Utilities
    class << self
      def author(attr = {}) # Clean up. Handle blank attributes.
        last = attr[:last] ? "#{attr[:last]}, " : nil
        first = attr[:first] ? "#{attr[:first]}" : nil
        middle = attr[:middle] ? " #{attr[:middle][0,1]}." : nil
        suffix = attr[:suffix] ? ", #{attr[:suffix]}" : nil

        "#{last}#{first}#{middle}#{suffix}"
      end

      def italicize(str)
        "<em>#{str}</em>"
      end

      def order(template, hash)
        ordered = Hash.new

        template.each do |e|
          if hash[e]
            ordered[e] = hash[e]
          end
        end

        ordered
      end

      def underline(str)
        "<u>#{str}</u>"
      end
    end
  end
end