module SimpleRecord
  class SimpleScope
    attr_reader :symbol, :foo

    def initialize(symbol)
      @symbol = symbol
    end

    def to_s
      "SELECT * \nFROM #{symbol} \n#{foo}"
    end

    def order(column_name)
      @order = "ORDER BY #{column_name}"
    end
  end
end
