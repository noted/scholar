module Scholar
  class Utilities
    module Formatters
      def capitalize(str)
        str.to_s.capitalize
      end

      def carets(str)
        "&#60;#{str.to_s}&#62;"
      end

      def colon(str)
        "#{str.to_s}:"
      end

      def comma(str)
        "#{str.to_s},"
      end

      def contributors(list)
        if list.is_a?(ContributorList)
          list.to_s
        end
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
