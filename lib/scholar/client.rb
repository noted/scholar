module Scholar
  class Client
    attr_accessor :output

    def initialize(options = {})
      @output = options[:output]
      @output ||= [:html, :markdown]
    end

    def cite(*args)
      Scholar::Citation.new(args)
    end
  end
end
