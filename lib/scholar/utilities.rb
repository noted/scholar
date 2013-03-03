module Scholar
  module Utilities
    class << self
      def carets(str)
        "&#60;#{str}&#62;"
      end

      def name(attr = {}) # Clean up. Handle blank attributes.
        last = attr[:last] ? "#{attr[:last]}, " : nil
        first = attr[:first] ? "#{attr[:first]}" : nil
        middle = attr[:middle] ? " #{attr[:middle][0,1]}." : nil
        suffix = attr[:suffix] ? ", #{attr[:suffix]}" : nil

        "#{last}#{first}#{middle}#{suffix}"
      end

      # Takes hashes that have arrays of hashes and makes
      #   root level arrays of hashes based on the :type
      #   key of the third-level hash. Holy hell.
      # Sweet deep-fried baby Jesus, this is terrible. Refactor this.
      def flatten(hash)
        hash.each do |k, v|
          if v.is_a?(Array)
            # Loop through Array's contents
            # If hash, make a new Array on the root of the
            #   resulting hash with the value of the :type
            #   element's value.
            # Remove this element from Hash.

            v.each do |e|
              if e.is_a?(Hash)
                type = hash[:type].pluralize
                e.remove(:type)

                if hash.has_key?(type)
                  hash[type] << e
                else
                  h = {
                    "#{type}" => [ e ]
                  }

                  hash.merge(h)
                end
              end
            end

            hash.delete(k)
          end
        end
      end

      def format(template, hash)
        # Replace symbols in template with hash key-values
        # Use `send(arr-value)` on everything in template

        template.each do |e|
          send(e)
        end
      end

      def italicize(str)
        "<em>#{str}</em>"
      end

      def order(template, hash)
        ordered = ActiveSupport::OrderedHash.new

        template.each do |e|
          if hash[e]
            ordered[e] = hash[e]
          end
        end

        ordered
      end

      def quotes(str)
        "&#8220;#{str}&#8221;"
      end

      def underline(str)
        "<u>#{str}</u>"
      end
    end
  end
end
