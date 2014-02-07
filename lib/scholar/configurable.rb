module Scholar
  module Configurable
    attr_accessor :output

    class << self
      def keys
        @keys ||= [
          :output
        ]
      end
    end

    def configure
      yield self
    end
  end
end
