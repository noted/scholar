module Scholar
  class Source < Utilities
    class << self
      def sequence(arr = nil)
        unless arr.nil?
          @@sequence = arr
        end

        self.descendants.empty? ? @@sequence : nil # Hackety-hax: fix inheritance issues.
      end

      def rules(&block)
        if block
          @@rules ||= []

          self.class_eval(&block)
        else
          self.descendants.empty? ? @@rules : nil
        end
      end

      def rule(key, &action)
        @@rules << [key, action]
      end
    end
  end

  Dir[File.dirname(__FILE__) + '/sources/*.rb'].each {|file| require file }
end
