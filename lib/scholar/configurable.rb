module Scholar

  # Configuration options for {Client}.
  module Configurable

    # @!attribute [w] output
    #   @return [Array] Types of citation output.

    attr_accessor :output

    class << self

      # List of configurable keys for {Scholar::Client}.
      # @return [Array] of option keys.
      def keys
        @keys ||= [
          :output
        ]
      end
    end

    # Set configuration options using a block.
    def configure
      yield self
    end
  end
end
