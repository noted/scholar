module Scholar
  class Utilities
    module Data
      def concatenate!(hash)
        hash.values.compact.reject(&:empty?).join(' ').squish
      end

      def contributors!(hash)
        data = hash[:contributors]

        hash.delete(:contributors)

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

        hash.merge(contributors)
      end

      def format!(hash, rules = [])
        rules.each do |key, action|
          unless hash[key].nil?
            hash[key] = Scholar::Utilities.instance_eval do
              action.call(hash[key])
            end
          end
        end

        hash
      end

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
