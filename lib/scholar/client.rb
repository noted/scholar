module Scholar
  class Client
    def initialize(options = {})
    end

    def cite(*args)
      Scholar::Citation.new(args)
    end
  end
end
