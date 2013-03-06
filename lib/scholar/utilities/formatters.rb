module Scholar
  class Utilities
    module Formatters
      def carets(str)
        "&#60;#{str}&#62;"
      end

      def comma(str)
        "#{str},"
      end

      def italicize(str, hash = nil)
        if hash
          hash[str] = "<em>#{hash[str.to_sym]}</em>"
        else
          "<em>#{str}</em>"
        end
      end

      def period(str)
        "#{str}."
      end

      def quotes(str)
        "&#8220;#{str}&#8221;"
      end

      def underline(str)
        "<u>#{str}</u>"
      end
    end
  end
end
