module Scholar
  class Utilities
    class ContributorList
      attr_accessor :contributors, :names

      def initialize(arr, role = :nonauthor)
        # If there are plain hashes in the array, make them Contributors
        arr.each do |v|
          if v.is_a?(Hash) or v.is_a?(ActiveSupport::OrderedHash)
            v[arr.index(v)] = Contributor.new(v)
          end
        end

        # Reorder the first Contributor to use last-name-first order
        arr.each do |v|
          if arr.index(v) == 0 && role == :author
            v.reorder!(:last)
          else
            v.reorder!(:first)
          end
        end

        @contributors = arr

        @names = ""
        @contributors.each do |c|
          @names << "#{c.name}, "
        end
        @names = @names[0..-3]
      end
    end
  end
end
