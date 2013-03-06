module Scholar
  class Utilities
    module Data
      def concatenate!(hash)
        hash.values.compact.reject(&:empty?).join(' ').squish
      end

      def contributors!(hash)
        arr = hash[:contributors]

        # Make array of different roles.
        # Add empty arrays with role keys.
        # Add each to respective.

        roles = []
        arr.each do |c|
          unless arr.include? c[:role]
            roles << c[:role]
          end
        end

        roles.each do |r|
          hash[r] = []
        end

        arr.each do |c|
          hash[c[:role]] << c
        end

        hash.delete(:contributors)

        hash
      end

      def format!(hash, rules)
        rules.each do |key, action|
          hash[key] = Scholar::Utilities.instance_eval do
            action.call(hash[key])
          end
        end

        hash
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
