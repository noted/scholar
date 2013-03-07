module Scholar
  class Utilities
    module Formatters
      def capitalize(str = nil)
        str.to_s.capitalize
      end

      def carets(str = nil)
        "&#60;#{str.to_s}&#62;"
      end

      def colon(str = nil)
        "#{str.to_s}:"
      end

      def comma(str = nil)
        "#{str.to_s},"
      end

      def contributors(list)
        if list
          list.to_s
        end
      end

      def italicize(str = nil)
        "<em>#{str.to_s}</em>"
      end

      def ordinal(int = nil)
        ActiveSupport::Inflector.ordinalize(int.to_i)
      end

      def period(str = nil)
        "#{str.to_s}."
      end

      def quotes(str = nil)
        "&#8220;#{str.to_s}&#8221;"
      end

      def replace(str = nil)
        str.to_s
      end

      def underline(str = nil)
        "<u>#{str.to_s}</u>"
      end
    end
  end
end
