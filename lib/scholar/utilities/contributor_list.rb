module Scholar
  class Utilities
    class ContributorList
      attr_accessor :contributors, :names

      def initialize(arr, role = :nonauthor)
        @contributors = arr
        @role = role

        # If there are plain hashes in the array, make them Contributors
        @contributors = replace_hashes(@contributors)

        # Reorder the first Contributor to use last-name-first order
        @contributors = reorder_all(@contributors)

        # Create the names.
        @names = create_names(@contributors)
      end

      def to_s
        @names
      end

      private

      def replace_hashes(contributors)
        contributors.each do |c|
          if c.is_a?(Hash)
            contributors[contributors.index(c)] = Contributor.new(c)
          end
        end

        contributors
      end

      def reorder_all(contributors)
        contributors.each do |c|
          if contributors.index(c) == 0 && @role == :author
            c.reorder!(:last)
          else
            c.reorder!(:first)
          end
        end

        contributors
      end

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
