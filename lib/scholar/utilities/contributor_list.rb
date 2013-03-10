module Scholar
  class Utilities
    class ContributorList
      attr_accessor :contributors, :names

      def initialize(contributors, role = :nonauthor)
        @names = ""

        contributors.each do |c|
          if c.is_a?(Hash)
            contributors[contributors.index(c)] = Contributor.new(c)
          end
        end

        contributors.each do |c|
          if contributors.index(c) == 0 && role == :author
            c.reorder!(:last)
          else
            c.reorder!(:first)
          end

          @names << c.name

          unless contributors.last == c
            @names << ", "
          end
        end

        @contributors = contributors
        @role = role

        return self
      end
    end
  end
end
