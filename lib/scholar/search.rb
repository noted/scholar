module Scholar

  # A Search object containing search results
  # for a query (currently only searches the
  # Google Books API).
  class Search

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

      # Remember the query.
      @query = query

      # Get the raw data.
      @results = perform!(query)

      # Turn that data into something a Citation class can understand.
      @results = format!(@results)

      # Make a Citation for each.

      # return
    end

    private

    def perform!(query)
      request = @@connection.get do |r|
        r.url "/books/v1/volumes", :q => query
      end

      request.body
    end

    def format!(hash)
      arr = []

      hash["items"].each do |i|
        vol = i["volumeInfo"]

        arr << vol["title"]
      end

      arr
    end
  end
end
