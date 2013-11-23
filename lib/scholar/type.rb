require 'yaml'

module Scholar
  class Type
    attr_accessor :name, :sequence, :formatting

    def initialize(file)
      definition = YAML.load_file(file)

      @name       = definition['name']
      @sequence   = definition['sequence']
      @formatting = format!(definition['formatting'])
    end

    def order(data)

    end

    def formatting(data)
    end

    private

    def format!(list)
      formatters = []

      list.each do |element, actions|
        actions.each do |action, option|
          formatters << Scholar::Formatter.new(action.to_sym, option)
        end
      end

      return formatters
    end
  end
end
