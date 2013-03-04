module Scholar
  class Citation
    attr_accessor :data, :rules
    
    def initialize(options = {})
      source = "Scholar::Sources::#{options[:type].to_s.camelize}".constantize
      
      options.delete(:type)

      @data = options

      @data = Scholar::Utilities.order!(source.sequence, @data)
      @data = Scholar::Utilities.format!(source.rules, @data)

      @rules = source.rules
    end
  end
end
