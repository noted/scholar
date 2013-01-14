module Scholar
  class Client
    attr_accessor :config

    def initialize
      self.config ||= Configuration.new
      yield(config)
    end
  end

  class Configuration
    attr_accessor :easybib, :worldcat

    def initialize
      [:easybib, :worldcat].each do |k|
        instance_variable_set("@#{k.to_s}", nil)
      end
    end
  end
end