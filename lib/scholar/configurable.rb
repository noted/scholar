module Scholar
  module Configurable
    attr_accessor :output

    class << self
      def keys
        @keys ||= [
          :csl
        ]
      end
    end

    def configure
      yield self
    end
  end
end
