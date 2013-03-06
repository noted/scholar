module Scholar
  class Utilities
    class Contributor
      attr_accessor :data, :name

      @@first = [
        :type,
        :first,
        :middle,
        :last,
        :suffix
      ]

      @@last = [
        :type,
        :last,
        :first,
        :middle,
        :suffix
      ]

      def initialize(hash, order = :first)
        @data = order!(hash, order)

        @name = format!(@data)
      end

      def reorder!(order)
        @data = order!(@data, order)
        @name = format!(@data)

        self
      end

      def order?
        @data.first[0]
      end

      private

      def order!(hash, method = :first)
        if method == :last
          ordered = Scholar::Utilities.order!(@@last, hash)
        else
          ordered = Scholar::Utilities.order!(@@first, hash)
        end

        ordered[:order] = method

        ordered
      end

      def format!(data)
        hash = data.clone

        order = hash[:order]

        # Remove :role and :order
        [:role, :order].each do |k|
          hash.delete(k)
        end

        # Shorten middle name to initial.
        if hash[:middle]
          hash[:middle] = "#{hash[:middle][0,1]}."
        end

        # Add comma after last name if last-name-first order or suffix exists
        if order == :last || hash[:suffix]
          hash[:last] = "#{hash[:last]},"
        end

        # Add comma after middle name if last-name-first
        if order == :last && hash[:middle]
          hash[:middle] = "#{hash[:middle]},"
        end

        hash.values.compact.reject(&:empty?).join(' ').squish
      end
    end
  end
end
