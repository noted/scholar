module Scholar

  # Basic utilities to format data.
  class Utilities
    class << self
      def carets(str)
        "&#60;#{str}&#62;"
      end

      # To-do
      #   - take hashes ({:first => "John", :last => "Doe"}) and make
      #     proper strings out of them based on number of contributors
      #     (i.e., first is last name first, subsequent are first name
      #     first), order them in alphabetical order
      def contributors(arr)
        hash = {}

        arr.each do |c|
          type = c[:type].to_s.pluralize.to_sym
          c.delete(:type)

          unless hash.has_key?(type)
            hash[type] = []
          end

          hash[type] << c
        end

        hash
      end

      def names(arr)
      end

      # Holy crap this is messy.
      def name(hash, order = :first)
        if order == :last # Last name first.
          last = hash[:last] ? "#{hash[:last]}, " : nil
          first = hash[:first] ? "#{hash[:first]}" : nil
          middle = hash[:middle] ? " #{hash[:middle][0,1]}." : nil
          suffix = hash[:suffix] ? ", #{hash[:suffix]}" : nil

          str = "#{last}#{first}#{middle}#{suffix}"
        else # First name first.
          first = hash[:first] ? "#{hash[:first]} " : nil
          middle = hash[:middle] ? "#{hash[:middle][0,1]}. " : nil
          last = hash[:last] ? "#{hash[:last]}" : nil
          suffix = hash[:suffix] ? ", #{hash[:suffix]}" : nil

          str = "#{first}#{middle}#{last}#{suffix}"
        end

        str
      end

      def publication(attr = {})
        city = attr[:city] ? "#{attr[:city]}: " : nil
        name = attr[:name] ? "#{attr[:name]}, " : nil
        year = attr[:year] ? "#{attr[:year]}" : nil

        city + name + year
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

      def period(str)
        "#{str}."
      end
    end
  end
end
