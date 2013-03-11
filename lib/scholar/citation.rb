module Scholar

  # A Citation object containing the attributes of the
  # citation and the HTML citation itself.
  class Citation

    # The pieces of data in the Citation.
    attr_reader :attributes

    # The actual HTML citation.
    attr_reader :html

    # Creates a new Citation from the given attributes.
    #
    # ==== Attributes
    #
    # * +options+ - The attributes of the Citation.
    #
    # ==== Options
    #
    # * +:type+ - Not optional. The type of source you are citing.
    # * +:contributors+ - An array of hashes of contributors.
    #
    # ==== Examples
    #
    #   citation = Scholar::Citation.new({
    #     :type => :book,
    #     :title => "Foobar",
    #     :contributors => [
    #       {
    #         :role => :author,
    #         :first => "John",
    #         :last => "Sample"
    #       }
    #     ]
    #   })
    #
    # Obviously, you'd include more than that, but you need to see the
    # specific sources for more documentation.
    def initialize(options = {})
      source = "Scholar::Sources::#{options[:type].to_s.camelize}".constantize

      @attributes = options
      @attributes.delete(:type)

      @attributes = Scholar::Utilities.contributors!(@attributes)
      @attributes = Scholar::Utilities.order!(@attributes, source.sequence)

      attributes = @attributes.clone
      attributes = Scholar::Utilities.format!(attributes, source.rules)

      @html = Scholar::Utilities.concatenate!(attributes)
    end
  end
end
