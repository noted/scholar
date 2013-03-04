module Scholar
  class Source < Utilities
    class << self
      def sequence(arr = nil) # These conditionals are very hacky.
        if arr
          self.class_variable_set(:@@sequence, arr)
        else
          self.class_variable_get(:@@sequence)
        end
      end

      def rules(&block)
        if block
          self.class_variable_set(:@@rules, block)
        else
          self.class_variable_get(:@@rules)
        end
      end

      def rule() # No effing idea.
      end
    end
  end

  Dir[File.dirname(__FILE__) + '/sources/*.rb'].each {|file| require file }
end
