module Scholar
  class Citation
    attr_accessor :data, :rules

    def initialize(options = {})
      source = "Scholar::Sources::#{options[:type].to_s.camelize}".constantize

      options.delete(:type)

      @data = options

      options.each do |(attr, val)|
        instance_variable_set("@#{attr}", val)
        instance_eval "def #{attr}() @#{attr} end"
      end

      @data = Scholar::Utilities.order(source.sequence, @data)
      @data = Scholar::Utilities.format(source.rules, @data)

      @rules = source.rules
    end
  end
end
