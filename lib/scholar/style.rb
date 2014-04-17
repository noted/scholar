module Scholar
  class Style
    class << self
      def all
        CSL::Style.ls.collect { |s| CSL::Style.load(s) }
      end

      def all_as_html_options
        options = ''
        CSL::Style.ls.each do |s|
          loaded = CSL::Style.load(s)

          if loaded.has_info?
            options << "<option value='#{s}'>#{loaded.info.title}</option>"
          end
        end

        options
      end
    end
  end
end
