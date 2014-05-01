module Scholar
  class Style
    attr_accessor :csl, :title

    def initialize(shortname)
      @csl = CSL::Style.load(shortname)
      @title = @csl.info.title.to_s

      return self
    end

    def crawl
      @csl.bibliography.layout.each_child do |child|
        if child.methods.include?(:has_macro?)
          if child.has_macro?
            puts child.macro
          end
        end
      end
    end

    # Return the fields necessary to make a citation with this type.
    #
    # @param type   The source type (book, website, etc)
    # @param format Can return HTML fields (defaults to nil).
    #
    # @return       A Hash or Array of values.
    def fields(type, format = nil)
    end

    # Return all of the available styles.
    #
    # @return Array An array of available styles.
    def self.all
      styles = CSL::Style.ls.collect do |shortname|
        Scholar::Style.new(shortname)
      end

      return styles
    end

    def self.all_as_html_options
      options = ''
      CSL::Style.ls.each do |s|
        loaded = CSL::Style.load(s)

        if !loaded.nil? && loaded.has_info?
          options << "<option value='#{s}'>#{loaded.info.title}</option>"
        end
      end

      options
    end
  end
end
