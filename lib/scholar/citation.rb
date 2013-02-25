module Scholar
  class Citation
    attr_accessor :hash, :html

    def initialize(options = {})
      hash = ActiveSupport::OrderedHash.new(options)

      klass = hash[:type].camelize.constantize

      hash = order!(hash, klass.sequence)
      hash = format!(hash, klass.format)
    end

    private

    def order!(hash, sequence)
    end

    def format!(hash, sequence)
    end
  end
end
