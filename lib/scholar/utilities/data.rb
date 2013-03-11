module Scholar
  class Utilities
    module Data

      # Concatenates hashes values into space-separated String.
      # @param  attributes [Hash] Hash to concatenate.
      # @return [String]
      def concatenate!(attributes)
        attributes.values.compact.reject(&:empty?).join(' ').squish
      end

      # Take contributors in hash and makes a ContributorList for each role.
      # @param  attributes [Hash] The attributes of the Citation.
      # @return [Hash]
      def contributors!(attributes)
        data = attributes[:contributors]

        attributes.delete(:contributors)

        contributors = {}
        data.each do |c|
          role = c[:role].to_s.pluralize.to_sym

          if contributors.has_key?(role)
            contributors[role] << c
          else
            contributors[role] = [c]
          end
        end

        contributors.each do |role, list|
          if role == :authors
            contributors[role] = ContributorList.new(list, :author).names
          else
            contributors[role] = ContributorList.new(list).names
          end
        end

        attributes.merge(contributors)
      end

      # Formats the keys of a hash with given rules.
      # @param  attributes [Hash]  The attributes of the Citation.
      # @param  rules      [Array] An array of key and Proc values.
      # @return [Hash]
      def format!(attributes, rules = [])
        rules.each do |key, action|
          unless attributes[key].nil?
            attributes[key] = Scholar::Utilities.instance_eval do
              action.call(attributes[key])
            end
          end
        end

        attributes
      end

      # Re-orders a hash based on a template.
      # @param  hash [Hash] The hash to order.
      # @param  template [Array] An array of Symbols.
      # @return [ActiveSupport::OrderedHash]
      def order!(hash, template)
        ordered = ActiveSupport::OrderedHash.new

        template.each do |key|
          if hash[key]
            ordered[key] = hash[key]
          end
        end

        ordered
      end
    end
  end
end
