require 'spork'

Spork.prefork do
  require 'rspec'

  require_relative '../lib/scholar'

  RSpec.configure do |c|
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
          },
          :type => :book
        }
      end

      def html
        "Salinger, J. D. <u>Catcher in the Rye<\/u>. Boston: Little, Brown, 1995."
      end
    end
  end
end
