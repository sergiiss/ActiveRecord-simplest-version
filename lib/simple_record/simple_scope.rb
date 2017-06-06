module SimpleRecord
  class SimpleScope
    attr_reader :symbol, :order_sql

    def initialize(symbol)
      @symbol = symbol
    end

    def to_s
      "SELECT * \nFROM #{symbol}#{order_sql}"
    end

    def order(column_name)
      column_name =~ /^.*\s(asc|ASC|desc|DESC)$/

      @order_sql =
        if $1
          "\nORDER BY #{column_name}"
        else
          "\nORDER BY #{column_name} ASC"
        end
      self
    end
  end
end
