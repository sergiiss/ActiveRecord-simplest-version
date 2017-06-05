module SimpleRecord
  class Base
    def self.has_many(symbol)
      define_method(symbol) do
        SimpleScope.new(symbol)
      end
    end
  end
end
