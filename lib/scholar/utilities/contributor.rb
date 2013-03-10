module Scholar
  class Utilities
    class Contributor
      attr_accessor :data, :name

      def initialize(hash, order = :first)
        @order = order

        @attributes = order!(hash)
        @name = name!(@attributes)
      end

      def reorder!(order)
        @order = order

        @attributes = order!(@attributes, order)
        @name = name!(@attributes)

        if @name[-2, 2] == ".," # Fix this.
          @name = @name[0..-3]
        end

        self
      end

      private

      def order!(hash, method = @order)
        if method == :last
          sequence = [:role, :last, :first, :middle, :suffix]
        else
          sequence = [:role, :first, :middle, :last, :suffix]
        end

        ordered = Scholar::Utilities.order!(hash, sequence)
      end

      def name!(attributes)
        hash = attributes.clone

        [:role, :order].each do |k|
          hash.delete(k)
        end

        if hash[:middle]
          hash[:middle] = "#{hash[:middle][0,1].upcase}."
        end

        if @order == :last || hash[:suffix]
          hash[:last] = "#{hash[:last]},"
        end

        if @order == :last && hash[:middle]
          hash[:middle] = "#{hash[:middle]},"
        end

        hash.values.compact.reject(&:empty?).join(' ').squish
      end
    end
  end
end
