module Scholar
  class Utilities
    class << self
      def order!(template, hash)
        ordered = ActiveSupport::OrderedHash.new

        template.each do |e|
          if hash[e]
            ordered[e] = hash[e]
          end
        end

        ordered
      end

      def format!(rules, hash)

      end

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

      def italicize(str, hash = nil)
        if hash
          hash[str] = "<em>#{hash[str.to_sym]}</em>"
        else
          "<em>#{str}</em>"
        end
      end

      def order!(template, hash)
        ordered = ActiveSupport::OrderedHash.new

        template.each do |e|
          if hash[e]
            ordered[e] = hash[e]
          end
        end

        ordered
      end

      def format!(rules, data)
        rules.each do |key, action|
          data[key] = Scholar::Utilities.instance_eval do
            action.call(data[key])
          end
        end

        data
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
