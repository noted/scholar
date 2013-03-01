module Scholar
  class Citation
    attr_accessor :hash, :html

    def initialize(options = {})
      # Flatten hash.
      # Make separate arrays for authors, editors, translators, compilers.
      # Order.
      # Format.

      @hash = options
    end

    def to_html
    end
  end
end
