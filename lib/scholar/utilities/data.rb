module Scholar
  class Utilities
    module Data
      def concatenate!(hash)
        hash.values.compact.reject(&:empty?).join(' ').squish
      end

      def contributors!(hash)
        raw = hash[:contributors]

        hash.delete(:contributors)

        # Build list of roles.
        roles = []
        raw.each do |c|
          unless roles.include?(c[:role])
            roles << c[:role]
          end
        end

        # End result hash.
        contributors = {}

        # Pluralize the roles and make a blank array for each of them in the hash.
        roles.each do |r|
          r = r.to_s.pluralize.to_sym

          contributors[r] = []
        end

        # Sort each contributor into respective array.
        raw.each do |c|
          contributors[c[:role].to_s.pluralize.to_sym] << c

          c.delete(:role)
        end

        # Make a ContributorList out of every role.
        contributors.each do |role, list|
          if role == :authors
            contributors[role] = ContributorList.new(list, :author)
          else
            contributors[role] = ContributorList.new(list)
          end
        end

        # Merge and output that sucker.
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
