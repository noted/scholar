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
      s.easybib = "foobar"
    end
  end

  class Book
    class << self
      def hash
        {
          :media => :print,
          :title => "The Catcher in the Rye",
          :contributors => [
            {
              :type => :author,
              :first => "J",
              :middle => "D",
              :last => "Salinger"
            }
          ],
          :publisher => {
            :name => "Little, Brown",
            :city => "Boston",
            :year => "1995"
          }
        }
      end

      def html
        "Salinger, J. D. <u>Catcher in the Rye<\/u>. Boston: Little, Brown, 1995."
      end
    end
  end
end
