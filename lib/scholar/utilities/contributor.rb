module Scholar
  class Utilities
    class Contributor
      attr_accessor :data, :name

      FIRST = [ :role, :first, :middle, :last, :suffix ]
      LAST  = [ :role, :last, :first, :middle, :suffix ]

      def initialize(hash, order = :first)
        @order = order

        @attributes = order_attrs(hash)
        @name = create_name(@attributes)
      end

      def reorder!(order)
        @order = order

        @attributes = order_attrs(@attributes, order)
        @name = create_name(@attributes)

        if @name[-2, 2] == ".,"
          @name = @name[0..-3]
        end

        self
      end

      private

      def order_attrs(hash, method = @order)
        if method == :last
          ordered = Scholar::Utilities.order!(hash, LAST)
        else
          ordered = Scholar::Utilities.order!(hash, FIRST)
        end

        ordered
      end

      def create_name(data)
        hash = data.clone

        # Remove :role and :order
        [:role, :order].each do |k|
          hash.delete(k)
        end

        # Shorten middle name to initial.
        if hash[:middle]
          hash[:middle] = "#{hash[:middle][0,1].upcase}."
        end

        # Add comma after last name if last-name-first order or suffix exists
        if @order == :last || hash[:suffix]
          hash[:last] = "#{hash[:last]},"
        end

        # Add comma after middle name if last-name-first
        if @order == :last && hash[:middle]
          hash[:middle] = "#{hash[:middle]},"
        end

        # Now kiss!
        hash.values.compact.reject(&:empty?).join(' ').squish
      end
    end
  end
end
