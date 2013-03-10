module Scholar
  class Utilities
    class ContributorList
      attr_accessor :contributors, :names

      def initialize(arr, role = :nonauthor)
        @contributors = arr
        @role = role

        # If there are plain hashes in the array, make them Contributors
        @contributors.each do |c|
          if c.is_a?(Hash)
            @contributors[@contributors.index(c)] = Contributor.new(c)
          end
        end

        # Reorder the first Contributor to use last-name-first order
        @contributors.each do |c|
          if @contributors.index(c) == 0 && @role == :author
            c.reorder!(:last)
          else
            c.reorder!(:first)
          end
        end

        # Create the names.
        @names = create_names(@contributors)

        return self
      end

      private

      def create_names(contributors)
        names = ""

        contributors.each do |c|
          names << "#{c.name}, "
        end

        names = names[0..-3]

        names
      end
    end
  end
end
