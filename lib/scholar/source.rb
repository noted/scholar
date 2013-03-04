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

      def rules(*args) # This doesn't work, returns Array (should return Proc)
        if args
          self.class_variable_set(:@@rules, args)
        else
          self.class_variable_get(:@@rules)
        end
      end
    end
  end

  Dir[File.dirname(__FILE__) + '/sources/*.rb'].each {|file| require file }
end
