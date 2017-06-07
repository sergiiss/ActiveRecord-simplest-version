module SimpleRecord
  class SimpleScope
    attr_reader :symbol, :order_sql, :filter_request

    def initialize(symbol)
      @symbol = symbol
      @filter_request = ""

      @value_equal_to_array = false
    end

    def to_s
      "SELECT *\nFROM #{symbol}#{filter_request}#{order_sql}"
    end

    def order(column_name)
      @order_sql = "\nORDER BY #{column_name}"
      @order_sql = order_sql + " ASC" if column_name.split.length == 1

      self
    end

    def where(selection_condition)
      @filter_request =

        if selection_condition.class == Hash
          select_input_hash(selection_condition)

          "\nWHERE " + filter_request[0..-6]
        else
          "\nWHERE #{selection_condition}"
        end

      self
    end

    private

    attr_reader :value_equal_to_array

    def select_input_hash(selection_condition)
      if array?(selection_condition)
        convert_hash_value_array(selection_condition)
      else
        convert_simple_input_hash(selection_condition)
      end
    end

    def array?(input_hash)
      input_hash.each_value do |value|
        @value_equal_to_array = true if value.class == Array
      end

      value_equal_to_array
    end

    def convert_hash_value_array(input_hash)
      input_hash.each do |key, value|
        value =
          value.map do |element|
            element = "'#{element}'" if element.class == String
            element
          end

        @filter_request << "#{key} IN (#{value.join(", ")})#{" AND "}"
      end
    end

    def convert_simple_input_hash(input_hash)
      input_hash.each do |key, value|
        value = "'#{value}'" if value.class == String

        @filter_request << "#{key} = #{value} AND "
      end
    end
  end
end
