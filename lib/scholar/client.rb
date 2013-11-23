require 'active_support'

require 'scholar/version'
require 'scholar/configurable'
require 'scholar/type'
require 'scholar/formatter'

module Scholar
  class Client
    include Scholar::Configurable

    def initialize(options = {})
      Scholar::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Scholar.instance_variable_get(:"@#{key}"))
      end
    end
  end
end
