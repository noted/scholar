require 'yaml'

module Scholar
  class Type
    attr_accessor :name, :sequence, :formatting

    def initialize(file)
      definition = YAML.load_file(file)

      @name       = definition['name']
      @sequence   = sequence!(definition['sequence'])
      @formatting = formatting!(definition['formatting'])
    end

    def order(data)
      ordered = ActiveSupport::OrderedHash.new

      @sequence.each do |key|
        if data[key]
          ordered[key] = data[key]
        end
      end

      return ordered
    end

    def format(data)
      output = ActiveSupport::OrderedHash.new

      data.each do |key, value|
        if formatters = @formatting[key.to_sym]
          formatted = value

          formatters.each do |formatter|
            formatted = formatter.execute(formatted)
          end

          output[key.to_sym] = formatted
        end
      end

      return output
    end

    private

    def sequence!(list)
      return list.map(&:to_sym)
    end

    def formatting!(list)
      formatters = {}

      list.each do |element, actions|
        formatters[element.to_sym] = []

        actions.each do |action, option|
          formatters[element.to_sym] << Scholar::Formatter.new(action.to_sym, option)
        end
      end

      return formatters
    end
  end
end
