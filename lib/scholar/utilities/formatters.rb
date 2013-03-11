module Scholar
  class Utilities

    # String formatters.
    module Formatters

      # Capitalize the first character of a String.
      # @param  str [String] String to capitalize.
      # @return [String]
      def capitalize(str)
        str.to_s.capitalize
      end

      # Add carets (<>) around String.
      # @param  str [String]
      # @return [String]
      def carets(str)
        "&#60;#{str.to_s}&#62;"
      end

      # Add colon to the end of a String.
      # @param  str [String]
      # @return String
      def colon(str)
        "#{str.to_s}:"
      end

      def comma(str)
        "#{str.to_s},"
      end

      def italicize(str)
        "<em>#{str.to_s}</em>"
      end

      def ordinal(int)
        ActiveSupport::Inflector.ordinalize(int.to_i)
      end

      def period(str)
        "#{str.to_s}."
      end

      def quotes(str)
        "&#8220;#{str.to_s}&#8221;"
      end

      def replace(str)
        str.to_s
      end

      def underline(str)
        "<u>#{str.to_s}</u>"
      end
    end
  end
end
