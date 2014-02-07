require 'rspec'
require 'factory_girl'

require 'log_buddy'

require_relative '../lib/scholar'

def client
  Scholar::Client.new(
    csl: 'modern-language-association'
  )
end
