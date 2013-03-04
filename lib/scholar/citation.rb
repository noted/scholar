module Scholar

  # Generates the actual citation by grabbing data from Source.
  class Citation
    attr_accessor :data

    def initialize(options = {})
      source = "Scholar::Sources::#{options[:type].to_s.camelize}".constantize

      options.delete(:type)

      @data = options

      @data = Scholar::Utilities.order!(source.sequence, @data)
      @data = Scholar::Utilities.format!(source.rules, @data)
    end
  end
end
