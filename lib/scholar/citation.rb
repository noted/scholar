module Scholar
  def cite(options = {})
    self.class::Citation.new(options)
  end

  class Citation
    attr_accessor :data, :json, :html

    def initialize(options = {})
      @data = build_hash!(options)
    end

    private

    def build_hash!(raw = {})
      result = Hash.new
      
      contributors = raw[:contributors]
      raw.delete('contributors')

      publication = raw[:publication]
      raw.delete('publication')

      #result[:key] = self.conf.easybib

      result[:source] = raw[:type].to_s
      raw.delete('type')

      result[:style] = "mla"

      unless result[:source] = "book"
        result.store(result[:source], raw)
      end

      contributors.each do |c|
        c.store("function", c[:type].to_s)
        c.delete('type')
      end

      result[:contributors] = contributors

      case result[:source]
      when "book"
        result.store("book", {})

        publication[:title] = raw[:title]
        result.store("pubnonperiodical", publication)
      when "website"
        result.store("pubonline", publication)
      else
        result.store("pub#{result[:store]}", publication)
      end

      result
    end
  end
end