require 'citeproc'
require 'csl/styles'

require_relative 'version'
require_relative 'configurable'
require_relative 'citation'
require_relative 'style'

module Scholar
  class Client
    include Scholar::Configurable

    def initialize(options = {})
      Scholar::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Scholar.instance_variable_get(:"@#{key}"))

        self.class.send(:define_method, key) do
          options[key]
        end
      end
    end

    def cite(source)
      return Scholar::Citation.new(source, @csl)
    end
  end
end
