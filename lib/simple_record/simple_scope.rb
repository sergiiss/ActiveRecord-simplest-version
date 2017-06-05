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
      @foo =
        case column_name
        when "created_at DESC"
          "ORDER BY #{column_name}"
        when "created_at ASC" || "created_at"
          "ORDER BY #{column_name}"
        end
      self
    end
  end
end
