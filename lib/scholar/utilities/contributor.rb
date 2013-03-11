module Scholar
  class Utilities

    # A person associated with a work.
    class Contributor

      # The data associated with the person.
      attr_reader :attributes

      # The name in the correct format.
      attr_reader :name

      # Create a Contributor.
      #
      # ==== Attributes
      #
      # * +hash+ - The data associated with the Contributor.
      # * +order+ - Last-name first (+:last+) or first-name first (+:first+).
      #
      # ==== Options
      #
      # * +:first+ - The name of the Contributor.
      # * +:middle+ - The middle name of the Contributor. Will be shortened to an initial.
      # * +:last+ - The surname of the Contributor.
      # * +:suffix+ - The suffix of the Contributor (PhD, Esq, etc).
      #
      # ==== Examples
      #
      #   Scholar::Utilities::Contributor.new({:first => "Douglas", :last => "Adams"})
      def initialize(hash, order = :first)
        @order = order

        @attributes = order!(hash)
        @name = name!(@attributes)
      end

      # Reorders the name of the Contributor with the given order.
      #
      # ==== Attributes
      #
      # * +order+ - Either +:first+ or +:last+ name first.
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

      # Order according to the sequence.
      def order!(hash, method = @order)
        if method == :last
          sequence = [:role, :last, :first, :middle, :suffix]
        else
          sequence = [:role, :first, :middle, :last, :suffix]
        end

        ordered = Scholar::Utilities.order!(hash, sequence)
      end

      # Generate the name with the given hash.
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
