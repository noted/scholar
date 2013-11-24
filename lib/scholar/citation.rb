module Scholar
  class Citation
    attr_accessor :type, :citation

    def initialize(type_name, data)
      @type = find_type_definition(type_name)

      @citation = @type.format(data)
      @citation = @type.order(@citation)
    end

    private

    def find_type_definition(name)
      file = File.open(File.join(File.expand_path(File.dirname(__FILE__)), 'types', "#{name.to_s}.yml"))

      return Scholar::Type.new(file)
    end
  end
end
