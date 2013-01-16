module Scholar
  def cite(options = {})
    self.class::Citation.cite(options)
  end

  class Citation
    attr_accessor :data, :json, :html

    def initialize
    end
  end
end