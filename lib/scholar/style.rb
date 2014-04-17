module Scholar
  class Style
    class << self
      def all
        CSL::Style.ls.collect { |s| CSL::Style.load(s) }
      end

      def all_as_html_options
        options = ''
        CSL::Style.ls.each do |s|
          options << "<option value='#{s}'>#{CSL::Style.load(s).info.title}</option>"
        end

        options
      end
    end
  end
end
