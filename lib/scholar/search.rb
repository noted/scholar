module Scholar

  # A Search object containing search results
  # for a query (currently only searches the
  # Google Books API).
  class Source

    # The query performed.
    attr_reader :query

    # The results of the query.
    attr_reader :results

    def initialize(query, options = {})
      @@connection = Faraday.new(:url => "https://www.googleapis.com") do |f|
        f.request  :json
        f.response :json, :content_type => /\bjson$/
        f.adapter  Faraday.default_adapter
      end

      # Get the raw data.
      @results = perform!(query)

      # Turn that data into something a Citation class can understand.

      # Make a Citation for each.

      # return
    end

    private

    def perform!(query)
      @@connection.get do |r|
        r.get "/books/v1/volumes", :q => query
      end
    end

    def format!(json)
    end
  end
end
