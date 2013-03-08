require 'spork'

Spork.prefork do
  require 'rspec'
  require 'factory_girl'

  require_relative '../lib/scholar'

  FactoryGirl.find_definitions

  RSpec.configure do |c|
    c.include FactoryGirl::Syntax::Methods
  end
end
