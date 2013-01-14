require 'spork'

Spork.prefork do
  require 'rspec'
  require 'vcr'
  require 'webmock'

  require_relative '../lib/scholar'

  RSpec.configure do |c|
    c.extend VCR::RSpec::Macros
  end

  VCR.configure do |c|
    c.cassette_library_dir = "spec/cassettes"
    c.hook_into :webmock
  end

  def scholar
    Scholar::Client.new do |s|
      s.easybib_key "foobar"
    end
  end

  class Book
    class << self
      def hash
        {
          :title => "Catcher in the Rye",
          :contributors => [
            {
              :function => "author",
              :first => "J",
              :middle => "D",
              :last => "Salinger"
            }
          ],
          :publisher => "Little, Brown",
          :city => "Boston",
          :year => "1995"
        }
      end

      def json
      end

      def html
      end
    end
  end
end