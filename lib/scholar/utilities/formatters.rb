module Scholar
  class Utilities
    module Formatters
      # TO-DO: Don't do anything if blank or nil.

      def carets(str)
        "&#60;#{str}&#62;"
      end

      def colon(str)
        "#{str}:"
      end

      def comma(str)
        "#{str},"
      end

      def names(arr, role)
        Scholar::Utilities::ContributorList.new(arr, role)
      end

      def italicize(str, hash = nil)
        if hash
          hash[str] = "<em>#{hash[str.to_sym]}</em>"
        else
          "<em>#{str}</em>"
        end
      end

      def ordinal(int)
        ActiveSupport::Inflector.ordinalize(int.to_i)
      end

      def period(str)
        "#{str}."
      end

      def quotes(str)
        "&#8220;#{str}&#8221;"
      end

      def replace(str)
        str
      end

      def underline(str)
        "<u>#{str}</u>"
      end
    end
  end
end
