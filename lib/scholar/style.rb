module Scholar
  class Style
    def self.all
      files = Dir["#{SCHOLAR_ROOT}/vendor/citation-styles/*.csl"]

      styles = []
      files.each do |file|
        filename = file.split('/').pop.split('.').first

        styles << CSL::Style.load(filename)
      end

      return styles
    end
  end
end
