module Scholar
  class Client
    attr_accessor :output

    def initialize(options = {})
      @output = options[:output]
      @output ||= [:html, :markdown]
    end
  end
end
