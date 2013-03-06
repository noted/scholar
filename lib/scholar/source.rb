module Scholar
  class Source < Utilities
    class << self
      def sequence(arr = nil)
        arr.nil? ? @@sequence : @@sequence = arr
      end

      def rules(&block) # These conditionals are very hacky.
        if block
          @@rules ||= []

          self.class_eval(&block)
        else
          @@rules
        end
      end

      def rule(key, &action) # To-fix
        @@rules << [key, action]
      end
    end
  end

  Dir[File.dirname(__FILE__) + '/sources/*.rb'].each {|file| require file }
end
