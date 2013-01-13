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
end