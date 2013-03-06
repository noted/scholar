module Scholar
  class Utilities
    module Data
      def format!(hash, rules)
        rules.each do |key, action|
          hash[key] = Scholar::Utilities.instance_eval do
            action.call(hash[key])
          end
        end

        data
      end

      def order!(hash, template)
        ordered = ActiveSupport::OrderedHash.new

        template.each do |e|
          if hash[e]
            ordered[e] = hash[e]
          end
        end

        ordered
      end
    end
  end
end
