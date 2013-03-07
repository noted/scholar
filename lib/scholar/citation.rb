module Scholar
  class Citation
    attr_accessor :data, :html

    def initialize(options = {})
      source = "Scholar::Sources::#{options[:type].to_s.camelize}".constantize

      @data = options
      @data.delete(:type)

      @data = Scholar::Utilities.contributors!(@data)
      @data = Scholar::Utilities.order!(@data, source.sequence)
      @data = Scholar::Utilities.format!(@data, source.rules)

      @html = Scholar::Utilities.concatenate!(@data)
    end
  end
end
