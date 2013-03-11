module Scholar

  # The basis for sources. Inherit from this class to create
  # other types of sources.
  class Source < Utilities
    class << self

      # Defines the order of attributes for Sources.
      # @param  arr [Array] The order in which attributes are ordered.
      # @return nil
      def sequence(arr = nil)
        unless arr.nil?
          @@sequence = arr
        end

        self.descendants.empty? ? @@sequence : nil
      end

      # Defines what actions need to be taken on the attributes.
      # @param  block [Proc] An array of rules.
      # @return nil
      def rules(&block)
        if block
          @@rules ||= []

          self.class_eval(&block)
        else
          self.descendants.empty? ? @@rules : nil
        end
      end

      # Defines a specific action to be taken on an attribute.
      # @param key    [Symbol] The key of the attribute.
      # @param action [Proc]   The action to take on the key (from Scholar::Utilities).
      def rule(key, &action)
        @@rules << [key, action]
      end
    end
  end

  Dir[File.dirname(__FILE__) + '/sources/*.rb'].each {|file| require file }
end
