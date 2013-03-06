module Scholar
  class Utilities
    class << self
      def carets(str)
        "&#60;#{str}&#62;"
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

      def comma(str)
        "#{str},"
      end
    end

    Dir[File.dirname(__FILE__) + '/utilities/*.rb'].each {|file| require file }
  end
end
