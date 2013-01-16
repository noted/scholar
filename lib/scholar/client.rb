module Scholar
  class Client
    attr_accessor :conf

    def initialize
      self.conf ||= Configuration.new
      yield(conf)
    end
  end

  class Configuration
    attr_accessor :easybib, :worldcat, :format

    def initialize
      [:easybib, :worldcat, :format].each do |k|
        instance_variable_set("@#{k.to_s}", nil)
      end
    end
  end
end