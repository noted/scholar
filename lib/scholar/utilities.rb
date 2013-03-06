module Scholar
  class Utilities
    Dir[File.dirname(__FILE__) + '/utilities/*.rb'].each {|file| require file }

    extend Scholar::Utilities::Formatters
    extend Scholar::Utilities::Data
  end
end
