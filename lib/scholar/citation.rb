module Scholar
  class Citation
    def initialize
    end

    private

    # Formats each attribute accordingly.
    def format(hash)
    end

    # Reorders attributes (elements) according to the template.
    def order(template, hash)
    end
  end

  class Book < Citation
    def initialize(options = {})
      order = [
        :authors,
        :title,
        :editor,
        :compiler,
        :translator,
        :edition,
        :volume,
        :publisher,
        :medium,
        :series
      ]
    end
  end
end