module Scholar
  class Client
    attr_accessor :output

    def initialize(options = {})
    end

    def cite(*args)
      Scholar::Citation.new(args)
    end
  end
end
