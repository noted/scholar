module Scholar
  module Source
    def sequence(arr = nil) # These conditionals are very hacky.
      if arr
        self.class_variable_set(:@@sequence, arr)
      else
        self.class_variable_get(:@@sequence)
      end
    end
  end

  Dir[File.dirname(__FILE__) + '/sources/*.rb'].each {|file| require file }
end
