module Scholar
  class Formatter
    attr_accessor :action, :option

    def initialize(action, option = nil)
      @action = action
      @option = option

      return self
    end

    def execute(value)
      return send(@action, value, @option)
    end

    private

    def period(value, option)
      "#{value}."
    end

    def comma(value, option)
      "#{value},"
    end

    def italicize(value, option)
      "<em>#{value}</em>"
    end

    def emphasize(value, option)
      "<strong>#{value}</em>"
    end

    def prefix(value, option)
      "#{option} #{value}"
    end

    def suffix(value, option)
      "#{value} #{option}"
    end

    def capitalize(value, option)
      "#{value}".capitalize
    end

    def ordinal(value, option)
      ActiveSupport::Inflector.ordinalize(value.to_i)
    end

    def quotes(value, option)
      "&#8220;#{value}&#8221;"
    end

    def colon(value, option)
      "#{value}:"
    end

    def carets(value, option)
      "&#60;#{value}&#62;"
    end
  end
end
