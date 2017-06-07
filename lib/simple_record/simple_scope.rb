module SimpleRecord
  class SimpleScope
    attr_reader :symbol, :order_sql, :filter_request

    def initialize(symbol)
      @symbol = symbol
      @filter_request = ""
    end

    def to_s
      "SELECT *\nFROM #{symbol}#{filter_request}#{order_sql}"
    end

    def order(column_name)
      @order_sql = "\nORDER BY #{column_name}"
      @order_sql = order_sql + " ASC" if column_name.split.length == 1

      self
    end

    def where(condition)
      @filter_request =
        case
        when condition.class == Hash
          condition.each do |key, value|
            value = "'#{value}'" if value.class == String

            @filter_request << "#{key} = #{value} AND "
          end

          "\nWHERE " + filter_request[0..-6]
        else
          "\nWHERE #{condition}"
        end

      self
    end
  end
end
